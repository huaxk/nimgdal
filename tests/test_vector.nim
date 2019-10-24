import os, unittest
import gdal, ogr

const dataDir = currentSourcePath.parentDir()/"data"
const outDir = currentSourcePath.parentDir()/"out"
const filename = dataDir/"point.json"

suite "test ogr api":
  echo versionInfo("GDAL_VERSION_NUM")
  
  setup:
    registerAll()

  test "OGR openEx":
    # let ds = open(filename, FALSE, nil)
    let ds = openEx(filename, GDAL_OF_VECTOR, nil, nil, nil)
    check:
      not isNil(ds)
      ds.getLayerCount == 1
    let layer = ds.getLayer(0)
    # let layerName = if parseInt($VersionInfo("VERSION_NUM")) >= 2020000: "point" else: "OGRGeoJSON"
    let layerName = "point"
    let layerByName = ds.getLayerByName(layerName)
    check layer == layerByName

    layer.resetReading

    let featureDefn = layer.getLayerDefn
    check featureDefn.getFieldCount == 2

    let
      fieldDefn0 = featureDefn.getFieldDefn(0)
      fieldDefn1 = featureDefn.getFieldDefn(1)
    check:
      fieldDefn0.getType == OFTReal
      fieldDefn1.getType == OFTString

    var feature = layer.getNextFeature
    check:
      not isNil(feature)
      feature.getFieldAsDouble(0) == 2.0
      feature.getFieldAsString(1) == "point-a"
    feature = layer.getNextFeature
    check:
      not isNil(feature)
      feature.getFieldAsDouble(0) == 3.0
      feature.getFieldAsString(1) == "point-b"      

    let geometry = feature.getGeometryRef
    check:
      geometry.getGeometryName == "POINT"
      geometry.getGeometryType == wkbPoint
      featureDefn.getGeomFieldCount == 1
      geometry.getX(0) == 100.2785
      geometry.getY(0) == 0.0893

    check $geometry.exportToJson == """{ "type": "Point", "coordinates": [ 100.2785, 0.0893 ] }"""
    # var wkt: cstring = ""
    # var pwkt: ptr cstring = wkt.addr
    # check geometry.ExportToWkt(pwkt) == OGRERR_NONE

    feature.destroy
    # ds.destroy
    ds.close

  test "write to OGR":
    let
      pointSharpFile = outDir/"point_out.shp"
      driver = ogr.getDriverByName("ESRI Shapefile")
      ds = driver.createDataSource(pointSharpFile, nil)
      layer = ds.createLayer("point_out", nil, wkbPoint, nil)
      fieldDefn = create("Name", OFTString)
    fieldDefn.setWidth(32)
    # check layer.CreateField(fieldDefn, TRUE) == OGRERR_NONE
    fieldDefn.destroy

    # let
    #   featureDefn = layer.GetLayerDefn
    #   feature = featureDefn.Create()
    # feature.SetFieldString(feature.GetFieldIndex("Name"), "myname")
