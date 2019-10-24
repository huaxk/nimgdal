import os, strutils, unittest
import gdal, ogr

const dataDir = currentSourcePath.parentDir()/"data"
const outDir = currentSourcePath.parentDir()/"out"
const filename = dataDir/"point.json"

echo versionInfo("GDAL_VERSION_NUM")

suite "test ogr api":
  setup:
    ogr.registerAll()

  test "gdal openEx":
    let ds = openEx(filename, GDAL_OF_VECTOR, nil, nil, nil)
    check:
      not isNil(ds)
      ds.getLayerCount == 1    
    let
      layer = ds.getLayer(0)
      versionNum = parseInt($versionInfo("VERSION_NUM"))
      layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
      layerByName = ds.getLayerByName(layerName)
    check layer == layerByName

  test "OGR open":
    let ds = open(filename, FALSE, nil)
    check:
      not isNil(ds)
      ds.getLayerCount == 1
    let
      layer = ds.getLayer(0)
      versionNum = parseInt($versionInfo("VERSION_NUM"))
      layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
      layerByName = ds.getLayerByName(layerName)
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

    var wkt = allocCStringArray([])
    check:
      geometry.exportToWkt(wkt) == OGRERR_NONE
      wkt.cstringArrayToSeq.len == 1
      $wkt[0] == "POINT (100.2785 0.0893)"
    # deallocCStringArray(wkt)

    feature.destroy
    ds.close

  test "write to OGR":
    let
      pointSharpFile = outDir/"point_out.shp"
      driver = ogr.getDriverByName("ESRI Shapefile")
      ds = driver.createDataSource(pointSharpFile, nil)
      layer = ds.createLayer("point_out", nil, wkbPoint, nil)
      fieldDefn = create("Name", OFTString)
    fieldDefn.setWidth(32)
    check layer.createField(fieldDefn, TRUE) == OGRERR_NONE
    fieldDefn.destroy

    let
      featureDefn = layer.getLayerDefn
      feature = featureDefn.create()
    feature.setFieldString(feature.getFieldIndex("Name"), "myname")
    let point = createGeometry(wkbPoint)
    point.setPoint_2D(0, 100.123, 0.123)
    check:
      feature.setGeometry(point) == OGRERR_NONE
      layer.createFeature(feature) == OGRERR_NONE
      layer.getFeatureCount(0) == 1
    point.destroyGeometry()

    check ds.getFileList.cstringArrayToSeq == @[outDir/"point_out.shp",
                                                outDir/"point_out.shx",
                                                outDir/"point_out.dbf"]
            
    feature.destroy
    ds.close