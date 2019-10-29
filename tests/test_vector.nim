import os, strutils, unittest
import gdal

const dataDir = currentSourcePath.parentDir()/"data"
const outDir = currentSourcePath.parentDir()/"out"
const filename = dataDir/"point.json"

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
        geom.exportToWkt == "POINT (100 0)"

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
          geom.exportToWkt == "POINT (100.2785 0.0893)"      
        echo geom.exportToWkb(wkbNDR)
        
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
