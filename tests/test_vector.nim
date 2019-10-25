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

      check:
        layer.featureCount == 4
        layer.fieldCount == 2

      let
        field0 = layer.layerDefn[0]
        field1 = layer.layerDefn[1]
      check:
        field0.type == OFTReal
        field0.name == "FID"
        field1.type == OFTString
        field1.name == "pointname"

      let ft = layer[0]
      check:
        ft.getFieldAsDouble(0) == 2.0
        ft.getFieldAsString(1) == "point-a"

  test "withOgrOpen":
    withOgrOpen(ds, filename, false, nil):
      let
        layer = ds[0]
        versionNum = parseInt($versionInfo("VERSION_NUM"))
        layerName = if versionNum >= 2020000: "point" else: "OGRGeoJSON"
        layerByName = ds[layerName]
      check layer == layerByName