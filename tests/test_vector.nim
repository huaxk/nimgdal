import os, unittest, strutils
import gdal

const dataDir = currentSourcePath.parentDir()/"data"
const filename = dataDir/"point.json"

suite "test ogr api":
  setup:
    GDALAllRegister()

  test "OGR openEx":
    let ds = OpenEx(filename, GDAL_OF_VECTOR, nil, nil, nil)
    check:
      not isNil(ds)
      ds.GetLayerCount == 1
    let layer = ds.GetLayer(0)
    let layerName = if parseInt($VersionInfo("VERSION_NUM")) >= 2020000: "point" else: "OGRGeoJSON"
    let layerByName = ds.GetLayerByName(layerName)
    check layer == layerByName

    layer.ResetReading

    let featureDefn = layer.GetLayerDefn
    check featureDefn.GetFieldCount == 2

    let
      fieldDefn0 = featureDefn.GetFieldDefn(0)
      fieldDefn1 = featureDefn.GetFieldDefn(1)
    check:
      fieldDefn0.GetType == OFTReal
      fieldDefn1.GetType == OFTString

    var feature = layer.GetNextFeature
    check:
      not isNil(feature)
      feature.GetFieldAsDouble(0) == 2.0
      feature.GetFieldAsString(1) == "point-a"
    feature = layer.GetNextFeature
    check:
      not isNil(feature)
      feature.GetFieldAsDouble(0) == 3.0
      feature.GetFieldAsString(1) == "point-b"      

    let geometry = feature.GetGeometryRef
    check:
      geometry.GetGeometryName == "POINT"
      geometry.GetGeometryType == wkbPoint
      featureDefn.GetGeomFieldCount == 1
      geometry.GetX(0) == 100.2785
      geometry.GetY(0) == 0.0893

    check $geometry.ExportToJson == """{ "type": "Point", "coordinates": [ 100.2785, 0.0893 ] }"""
    # var wkt: cstring = ""
    # var pwkt: ptr cstring = wkt.addr
    # check geometry.ExportToWkt(pwkt) == OGRERR_NONE

    feature.Destroy
    ds.Close

  test "write to OGR":
    let
      pointSharpFile = dataDir/"point_out.shp"
      driver = GetDriverByName("ESRI Shapefile")
      ds = driver.CreateDataSource(pointSharpFile, nil)
      layer = ds.CreateLayer("point_out", nil, wkbPoint, nil)
      fieldDefn = Create("Name", OFTString)
    fieldDefn.SetWidth(32)
    # check layer.CreateField(fieldDefn, TRUE) == OGRERR_NONE
    fieldDefn.Destroy

    # let
    #   featureDefn = layer.GetLayerDefn
    #   feature = featureDefn.Create()
    # feature.SetFieldString(feature.GetFieldIndex("Name"), "myname")
