import times, math
import wrap/ogr_api
export ogr_api except exportToJson

type
  Field = object
    feature: OGRFeatureH
    idx: int

proc asInteger*(field: Field): int32 =
  result = field.feature.getFieldAsInteger(field.idx.cint)

proc asInteger64*(field: Field): int64 =
  result = field.feature.getFieldAsInteger64(field.idx.cint).int

proc asDouble*(field: Field): float64 =
  result = field.feature.getFieldAsDouble(field.idx.cint)

proc asString*(field: Field): string =
  result = $field.feature.getFieldAsString(field.idx.cint)

proc `$`*(field: Field): string =
  result = field.asString

proc asIntegerList*(field: Field): seq[cint] =
  var pnCount = 0.cint
  let pcintValue = field.feature.getFieldAsIntegerList(field.idx.cint, pnCount.addr)
  echo pnCount
  if pnCount == 0:
    result = @[]
  else:
    result = @(toOpenArray(cast[ptr UncheckedArray[cint]](pcintValue), 0, pnCount-1))

proc asInteger64List*(field: Field): seq[int] =
  var pnCount = 0.cint
  let pcintValue = field.feature.getFieldAsInteger64List(field.idx.cint, pnCount.addr)
  echo pnCount
  if pnCount == 0:
    result = @[]
  else:
    result = @(toOpenArray(cast[ptr UncheckedArray[int]](pcintValue), 0, pnCount-1))

proc asDoubleList*(field: Field): seq[float64] =
  var pnCount = 0.cint
  let doubleList = field.feature.getFieldAsDoubleList(field.idx.cint, pnCount.addr)
  if pnCount == 0:
    result = @[]
  else:
    let ua = cast[ptr UncheckedArray[float64]](doubleList)
    result = @(toOpenArray(ua, 0, pnCount-1))

proc asStringList*(field: Field): seq[string] =
  let value = field.feature.getFieldAsStringList(field.idx.cint)
  result = value.cstringArrayToSeq
  # deallocCStringArray(value)

proc asBinary*(field: Field): seq[char] =
  var pnBytes: cint
  let cucharList = field.feature.getFieldAsBinary(field.idx.cint, pnBytes.addr)  
  if pnBytes == 0:
    result = @[]
  else:
    let ua = cast[ptr UncheckedArray[char]](cucharList)
    result = @(toOpenArray(ua, 0, pnBytes-1))

proc asDateTime*(field: Field): DateTime =
  var pnYear, pnMonth, pnDay, pnHour, pnMinute, pnSecond, pnTZFlag: cint
  let value = field.feature.getFieldAsDateTime(field.idx.cint,
                                              pnYear.addr,
                                              pnMonth.addr,
                                              pnDay.addr,
                                              pnHour.addr,
                                              pnMinute.addr,
                                              pnSecond.addr,
                                              pnTZFlag.addr)
  if value == TRUE:
    let zone = case pnTZFlag:
      of 1:
        local()
      of 100:
        utc()
      else:
        raiseAssert("Unknown Timezone")
    result = initDateTime(pnDay, pnMonth.Month, pnYear, pnHour, pnMinute, pnSecond, 0, zone)
  else:
    raiseAssert("fail to asDateTime")

proc asDateTimeEx*(field: Field): DateTime =
  var pnYear, pnMonth, pnDay, pnHour, pnMinute, pnTZFlag: cint
  var pnSecond: cfloat
  let value = field.feature.getFieldAsDateTimeEx(field.idx.cint,
                                              pnYear.addr,
                                              pnMonth.addr,
                                              pnDay.addr,
                                              pnHour.addr,
                                              pnMinute.addr,
                                              pnSecond.addr,
                                              pnTZFlag.addr)
  if value == TRUE:
    let
      second = pnSecond.floor
      nanosecond = ((pnSecond - second) * 100000).int
      zone = case pnTZFlag:
        of 1:
          local()
        of 100:
          utc()
        else:
          raiseAssert("Unknown Timezone")
    result = initDateTime(pnDay, pnMonth.Month, pnYear, pnHour, pnMinute, second.int, nanosecond, zone)
  else:
    raiseAssert("fail to asDateTime")

# OGRDataSourceH
proc `[]`*(ds: OGRDataSourceH, idx: int): OGRLayerH {.inline.} =
  result = ds.getLayer(idx.cint)

proc `[]`*(ds: OGRDataSourceH, name: string): OGRLayerH {.inline.} =
  result = ds.getLayerByName(name)

iterator items*(ds: OGRDataSourceH): OGRLayerH =
  for i in 0 ..< ds.getLayerCount:
    yield ds.getLayer(i)

# OGRLayerH
proc `[]`*(layer: OGRLayerH, fid: int): OGRFeatureH {.inline.} =
  result = layer.getFeature(fid)

proc featureCount*(layer: OGRLayerH): int64 {.inline.} =
  result = layer.getFeatureCount(TRUE)

proc fieldCount*(layer: OGRLayerH): int {.inline.} =
  result = layer.getLayerDefn.getFieldCount

proc geomFieldCount*(layer: OGRLayerH): int {.inline.} =
  result = layer.getLayerDefn.getGeomFieldCount

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

# OGRFeatureH
proc `[]`*(ft: OGRFeatureH, idx: int): Field =
  result = Field(feature: ft, idx: idx)

proc `[]`*(ft: OGRFeatureH, fieldName: string): Field {.inline.} =
  result = ft[ft.getFieldIndex(fieldName)]

proc `[]=`*(ft: OGRFeatureH, idx: int, val: int32) {.inline.} =
  ft.setFieldInteger(idx.cint, val)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: int32) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: int64) {.inline.} =
  ft.setFieldInteger64(idx.cint, val)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: int64) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: float64) {.inline.} =
  ft.setFieldDouble(idx.cint, val)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: float64) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: string) {.inline.} =
  ft.setFieldString(idx.cint, val)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: string) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: openArray[int32]) {.inline.} =
  let
    nCount = val.len.cint
    value = cast[ptr cint](val)
  ft.setFieldIntegerList(idx.cint, nCount, value)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: openArray[int32]) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: openArray[int64]) {.inline.} =
  let
    nCount = val.len.cint
    value = cast[ptr GIntBig](val)
  ft.setFieldInteger64List(idx.cint, nCount, value)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: openArray[int64]) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: openArray[float64]) {.inline.} =
  let
    nCount = val.len.cint
    value = cast[ptr cdouble](val)
  ft.setFieldDoubleList(idx.cint, nCount, value)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: openArray[float64]) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: cstringArray) {.inline.} =
  ft.setFieldStringList(idx.cint, val)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: cstringArray) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: openArray[char]) {.inline.} =
  let
    nBytes = val.len.cint
    value = cast[ptr GByte](val)
  ft.setFieldBinary(idx.cint, nBytes, value)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: openArray[char]) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc `[]=`*(ft: OGRFeatureH, idx: int, val: DateTime) {.inline.} =
  let
    nYear = val.year.cint
    nMonth = val.month.cint
    nDay = val.monthday.cint
    nHour = val.hour.cint
    nMinute = val.minute.cint
    nNanosecond = val.nanosecond
    zone = val.timezone
    nTZFlag = if zone == local(): 1.cint
      elif zone == utc(): 100.cint
      else: 0.cint
  if nNanosecond == 0:
    let nSecond = val.second.cint
    ft.setFieldDateTime(idx.cint, nYear, nMonth, nDay, nHour, nMinute, nSecond, nTZFlag)
  else:
    let nSecondwithnano = (val.second.float + nNanosecond / 1000000).cfloat
    ft.setFieldDateTimeEx(idx.cint, nYear, nMonth, nDay, nHour, nMinute, nSecondwithnano, nTZFlag)

proc `[]=`*(ft: OGRFeatureH, fieldName: string, val: DateTime) {.inline.} =
  ft[ft.getFieldIndex(fieldName)] = val

proc geometry*(ft: OGRFeatureH): OGRGeometryH {.inline.} =
  result = ft.getGeometryRef

# OGRFeatureDefnH
proc fieldCount*(ftDefn: OGRFeatureDefnH): int {.inline.} =
  result = ftDefn.getFieldCount

proc `[]`*(ftDefn: OGRFeatureDefnH, idx: int): OGRFieldDefnH {.inline.} =
  result = ftDefn.getFieldDefn(idx.cint)

iterator pairs*(ftDefn: OGRFeatureDefnH): tuple[key: int32, val: OGRFieldDefnH] =
  for i in 0 ..< ftDefn.getFieldCount:
    yield (i, ftDefn.getFieldDefn(i))

proc geomFieldCount*(ftDefn: OGRFeatureDefnH): int {.inline.} =
  result = ftDefn.getGeomFieldCount

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

# OGRGeometryH
proc name*(geom: OGRGeometryH): string {.inline.} =
  result = $geom.getGeometryName

proc type*(geom: OGRGeometryH): OGRwkbGeometryType {.inline.} =
  result = geom.getGeometryType

proc exportToJson*(geom: OGRGeometryH): string = 
  result = $ogr_api.exportToJson(geom)

proc exportToWkt*(geom: OGRGeometryH): string =
  var wktArray = allocCStringArray([])
  # defer: deallocCStringArray(wktArray)
  let error = geom.exportToWkt(wktArray)
  if error == OGRERR_NONE:
    let wkt = wktArray.cstringArrayToSeq
    for i in 0..wkt.len-1:
      result &= wkt[i]
      if i < wkt.len-1:
        result &= "\n"

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

template withFeature*(feature: untyped, layer: OGRLayerH, fid: int, body: untyped) =
  var feature = layer.getfeature(fid)
  if isNil(feature):
    quit("layer has not feature with FID: " & $fid)
  try:
    body
  finally:
    feature.destroy
