import os, strutils, unittest
import gdal

const dataDir = currentSourcePath.parentDir()/"data"
const outDir = currentSourcePath.parentDir()/"out"
const filename = dataDir/"point.json"

suite "test gdal vector":
  setup:
    allRegister()
  
  test "withOpenEx":
    withOpenEx(ds, filename, GDAL_OF_VECTOR, nil, nil, nil):
      let
        layer = ds[0]
        versionNum = parseInt($versionInfo("VERSION_NUM"))
        layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
        layerByName = ds[layerName]
      check layer == layerByName


  test "withOgrOpen":
    withOgrOpen(ds, filename, false, nil):
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
      defer: ft.destroy
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

      withFeature(feature, layer, 1):
        check:
          feature["FID"].asDouble == 3.0
          feature["pointname"].asString == "point-b"

        let geom = feature.geometry
        check:
          geom.name == "POINT"
          geom.type == wkbPoint
          layer.layerDefn.geomFieldCount == 1
          geom.getX(0) == 100.2785
          geom.getY(0) == 0.0893

          geom.exportToJson == """{ "type": "Point", "coordinates": [ 100.2785, 0.0893 ] }"""
          geom.exportToWkt == "POINT (100.2785 0.0893)"        
        
  test "write to OGR":
    let
      pointSharpFile = outDir/"point_out.shp"
      driver = ogrGetDriverByName("ESRI Shapefile")
      ds = driver.createDataSource(pointSharpFile, nil)
      layer = ds.createLayer("point_out", nil, wkbPoint, nil)
      fieldDefn = newOGRFieldDefnH("Name", OFTString)
    defer: fieldDefn.destroy
    fieldDefn.width = 32
    check layer.createField(fieldDefn, TRUE) == OGRERR_NONE