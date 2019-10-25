import wrap/ogr_api
export ogr_api

# OGRDataSourceH
proc `[]`*(ds: OGRDataSourceH, idx: int): OGRLayerH {.inline.} =
  result = ds.getLayer(idx.cint)

proc `[]`*(ds: OGRDataSourceH, name: string): OGRLayerH {.inline.} =
  result = ds.getLayerByName(name)

iterator items*(ds: OGRDataSourceH): OGRLayerH =
  for i in 0 ..< ds.getLayerCount:
    yield ds.getLayer(i)

# OGRLayerH
proc `[]`*(layer: OGRLayerH, idx: int): OGRFeatureH {.inline.} =
  result = layer.getFeature(idx)

proc featureCount*(layer: OGRLayerH): int64 {.inline.} =
  result = layer.getFeatureCount(TRUE)

proc fieldCount*(layer: OGRLayerH): int {.inline.} =
  result = layer.getLayerDefn.getFieldCount

proc layerDefn*(layer: OGRLayerH): OGRFeatureDefnH {.inline.} =
  result = layer.getLayerDefn

iterator items*(layer: OGRLayerH): OGRFeatureH =
  layer.resetReading
  while true:
    var ft = layer.getNextFeature
    if isNil(ft):
      break
    try:
      yield ft
    finally:
      ft.destroy

# OGRFeatureDefnH
proc fieldCount*(ftDefn: OGRFeatureDefnH): int {.inline.} =
  result = ftDefn.getFieldCount

proc `[]`*(ftDefn: OGRFeatureDefnH, idx: int): OGRFieldDefnH {.inline.} =
  result = ftDefn.getFieldDefn(idx.cint)

iterator pairs*(ftDefn: OGRFeatureDefnH): tuple[key: int32, val: OGRFieldDefnH] =
  for i in 0 ..< ftDefn.getFieldCount:
    yield (i, ftDefn.getFieldDefn(i))

# OGRFieldDefnH
proc name*(fldDefn: OGRFieldDefnH): string =
  result = $fldDefn.getNameRef

proc type*(fldDefn: OGRFieldDefnH): OGRFieldType =
  result = fldDefn.getType

proc typename*(fldDefn: OGRFieldDefnH): string =
  result = $fldDefn.getType.getFieldTypeName

proc precision*(fldDefn: OGRFieldDefnH): int =
  result = fldDefn.getPrecision

proc width*(fldDefn: OGRFieldDefnH): int =
  result = fldDefn.getWidth

# template
template withOgrOpen*(hDS: untyped,
                      pszName: string,
                      bUpdate: bool,
                      pahDriverList: OGRSFDriverH,
                      body: untyped) =
  var hDS = ogrOpen(pszName, cint(bUpdate), pahDriverList)
  if isNil(hDS):
    quit("Open failed: " & pszName)
  try:
    body
  finally:
    hDS.destroy