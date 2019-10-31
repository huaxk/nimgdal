import os, strutils, unittest
import gdal

const dataDir = currentSourcePath.parentDir()/"data"
const outDir = currentSourcePath.parentDir()/"out"
const filename = dataDir/"point.json"

echo versionInfo("GDAL_VERSION_NUM")

suite "test geometry api":
  test "Point":
    var pt = newPoint(1.0, 2.0)
    echo pt.exportToWkt
    var pt2 = newPoint(3.0, 4.0)
    pt = pt2
    echo pt.exportToWkt

  test "Import from wkt and export to wkt":
    var geom = createGeometry(wkbPoint)
    defer: geom.destroyGeometry()
    let wktstr = "POINT (100.2785 0.0893)"
    geom.importFromWkt([wktstr])
    check geom.exportToWkt == [wktstr]
    geom.importFromWktStr(wktstr)
    check geom.exportToWktStr == wktstr

  test "Import from wkb and export to wkb":
    var geom = createGeometry(wkbPoint)
    defer: geom.destroyGeometry
    let wkbstr = "\x01" &
                  "\x01\x00\x00\x00" &
                  "\x00\x00\x00\x00\x00\x00\x00\x01" &
                  "\x00\x00\x00\x00\x00\x00\xf0?"
    geom.importFromWkb(wkbstr)
    check geom.exportToWkb(wkbNDR) == wkbstr
    let wkbhex = "01"&
                  "01000000"&
                  "000000000000F03F"&
                  "0000000000000040"
    geom.importFromWkbHex(wkbhex)
    check geom.exportToWkbHex(wkbNDR) == wkbhex

  test "Create geometry from geojson and export to json":
    let
      geojson = """{ "type": "Point", "coordinates": [ 100.0, 200.0 ] }"""
      geom = createGeometryFromJson(geojson)
    defer: geom.destroyGeometry
    check geom.exportToJson == geojson

suite "test vector api":
  setup:
    allRegister()

  test "Reading from OGR DataSource":
    withDataSource(ds, filename, false, nil):
      let
        layer = ds[0]
        versionNum = parseInt($versionInfo("VERSION_NUM"))
        layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
        layerByName = ds[layerName]
      check layer == layerByName

  test "Reading from GDAL Dataset":
    withDataset(ds, filename, GDAL_OF_VECTOR):
      let
        layer = ds[0]
        versionNum = parseInt($versionInfo("VERSION_NUM"))
        layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
        layerByName = ds[layerName]
      check:
        layer == layerByName
        layer.featureCount == 4
        layer.layerDefn.fieldCount == 2

      let
        field0 = layer.layerDefn[0]
        field1 = layer.layerDefn[1]
      check:
        field0.type == OFTReal
        field0.name == "FID"
        field1.type == OFTString
        field1.name == "pointname"

      let ft = layer[0]
      defer: ft.destroy # need to destroy feature by self
      check:
        ft[0].asDouble == 2.0
        ft[1].asString == "point-a"

      let geom = ft.geometry
      check:
        geom.name == "POINT"
        geom.type == wkbPoint
        layer.layerDefn.geomFieldCount == 1
        geom.getX(0) == 100.0
        geom.getY(0) == 0.0

        geom.exportToJson == """{ "type": "Point", "coordinates": [ 100.0, 0.0 ] }"""
        geom.exportToWktStr == "POINT (100 0)"

      layer.withFeature(ft1, 1):
        check:
          ft1["FID"].asDouble == 3.0
          ft1["pointname"].asString == "point-b"

        let geom = ft1.geometry
        check:
          geom.name == "POINT"
          geom.type == wkbPoint
          layer.layerDefn.geomFieldCount == 1
          geom.getX(0) == 100.2785
          geom.getY(0) == 0.0893

          geom.exportToJson == """{ "type": "Point", "coordinates": [ 100.2785, 0.0893 ] }"""
          geom.exportToWktStr == "POINT (100.2785 0.0893)"      
        
  test "Writing to OGR":
    let
      pointSharpFile = outDir/"point_out.shp"
      driverName = "ESRI Shapefile"
      driver = getDriverByName(driverName)
    
    check not isNil(driver)

    # driver.withCreateDataSource(ds, pointSharpFile):
    driver.withCreateDataset(ds, pointSharpFile, 0, 0, 0, GDT_Unknown, nil):
      # let layer = ds.createLayer("point_out", nil, wkbPoint, nil)
      let layer = ds.createLayer("point_out", nil, wkbPoint, nil)

      # layer.createField("Name", OFTString, 32)
      layer.withCreateField(fd, "Name", OFTString):
        fd.width = 32
      check:
        layer.layerDefn[0].name == "Name"
        layer.layerDefn["Name"].type == OFTString
        layer.layerDefn["Name"].width == 32
        layer.layerDefn["Name"].precision == 0
    
      layer.withCreateFeature(ft):
        ft["Name"] = "myname"
        ft.withSetGeometryDirectly(pt, wkbPoint):
          pt.setPoint_2D(0, 100.123, 0.123)
      
      check:
        layer[0]["Name"].asString == "myname"
        layer[0].geometry.name == "POINT"
        layer[0].geometry.type == wkbPoint
        layer[0].geometry.getX(0) == 100.123
        layer[0].geometry.getY(0) == 0.123

        ds.getFileList.cstringArrayToSeq == @[outDir/"point_out.shp",
                                              outDir/"point_out.shx",
                                              outDir/"point_out.dbf"]
