import times, math
import wrap/ogr_api
export ogr_api except exportToJson

type
  Field = object
    feature: OGRFeatureH
    idx: int

proc asInteger*(field: Field): int32 =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTInteger
  result = field.feature.getFieldAsInteger(idx)

proc asInteger64*(field: Field): int64 =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTInteger64
  result = field.feature.getFieldAsInteger64(idx).int

proc asDouble*(field: Field): float64 =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTReal
  result = field.feature.getFieldAsDouble(idx)

proc asString*(field: Field): string =
  result = $field.feature.getFieldAsString(field.idx.cint)

proc `$`*(field: Field): string =
  result = field.asString

proc asIntegerList*(field: Field): seq[cint] =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTIntegerList
  var pnCount = 0.cint
  let pcintValue = field.feature.getFieldAsIntegerList(idx, pnCount.addr)
  echo pnCount
  if pnCount == 0:
    result = @[]
  else:
    result = @(toOpenArray(cast[ptr UncheckedArray[cint]](pcintValue), 0, pnCount-1))

proc asInteger64List*(field: Field): seq[int] =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTInteger64List
  var pnCount = 0.cint
  let pcintValue = field.feature.getFieldAsInteger64List(idx, pnCount.addr)
  echo pnCount
  if pnCount == 0:
    result = @[]
  else:
    result = @(toOpenArray(cast[ptr UncheckedArray[int]](pcintValue), 0, pnCount-1))

proc asDoubleList*(field: Field): seq[float64] =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTRealList
  var pnCount = 0.cint
  let doubleList = field.feature.getFieldAsDoubleList(idx, pnCount.addr)
  if pnCount == 0:
    result = @[]
  else:
    let ua = cast[ptr UncheckedArray[float64]](doubleList)
    result = @(toOpenArray(ua, 0, pnCount-1))

proc asStringList*(field: Field): seq[string] =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTStringList
  let value = field.feature.getFieldAsStringList(idx)
  result = value.cstringArrayToSeq
  # deallocCStringArray(value)

proc asBinary*(field: Field): seq[char] =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType == OFTBinary
  var pnBytes: cint
  let cucharList = field.feature.getFieldAsBinary(idx, pnBytes.addr)  
  if pnBytes == 0:
    result = @[]
  else:
    let ua = cast[ptr UncheckedArray[char]](cucharList)
    result = @(toOpenArray(ua, 0, pnBytes-1))

proc asDateTime*(field: Field): DateTime =
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType in [OFTDateTime, OFTDate, OFTTime]
  var pnYear, pnMonth, pnDay, pnHour, pnMinute, pnSecond, pnTZFlag: cint
  let value = field.feature.getFieldAsDateTime(idx,
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
  let idx = field.idx.cint
  doAssert field.feature.getFieldDefnRef(idx).getType in [OFTDateTime, OFTDate, OFTTime]
  var pnYear, pnMonth, pnDay, pnHour, pnMinute, pnTZFlag: cint
  var pnSecond: cfloat
  let value = field.feature.getFieldAsDateTimeEx(idx,
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

# OGRFieldDefnH
# proc newOGRFieldDefnH*(name: string, fieldType: OGRFieldType): OGRFieldDefnH {.inline.} =
#   result = create(name, fieldType)

proc name*(fldDefn: OGRFieldDefnH): string {.inline.} =
  result = $fldDefn.getNameRef

proc `name=`*(fldDefn: OGRFieldDefnH, name: string) {.inline.} =
  fldDefn.setName(name)

proc type*(fldDefn: OGRFieldDefnH): OGRFieldType =
  result = fldDefn.getType

proc `type=`*(fldDefn: OGRFieldDefnH, typ: OGRFieldType) {.inline.} =
  fldDefn.setType(typ)

proc typename*(fldDefn: OGRFieldDefnH): string {.inline.} =
  result = $fldDefn.getType.getFieldTypeName

proc precision*(fldDefn: OGRFieldDefnH): int {.inline.} =
  result = fldDefn.getPrecision

proc `precision=`*(fldDefn: OGRFieldDefnH, precision: int) {.inline.} =
  fldDefn.setPrecision(precision.cint)

proc width*(fldDefn: OGRFieldDefnH): int {.inline.} =
  result = fldDefn.getWidth

proc `width=`*(fldDefn: OGRFieldDefnH, width: int) {.inline.} =
  fldDefn.setWidth(width.cint)

proc justify*(fldDefn: OGRFieldDefnH): OGRJustification {.inline.} =
  result = fldDefn.getJustify

proc `justify=`*(fldDefn: OGRFieldDefnH, justify: OGRJustification) {.inline.} =
  fldDefn.setJustify(justify)

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

proc createField*(layer: OGRLayerH, name: string, typ: OGRFieldType,
                  width = 0, precision = 0, justify = OJUndefined) =
  let fieldDefn = create(name, typ)
  if width != 0: fieldDefn.width = width
  if width != 0: fieldDefn.precision = precision
  fieldDefn.justify = justify

  let error = layer.createField(fieldDefn, TRUE)
  if error == OGRERR_NONE:
    fieldDefn.destroy
  else:
    raiseAssert("Fail to create field")

proc createField*(layer: OGRLayerH,
                fdDefns:openArray[tuple[name: string,
                                        typ: OGRFieldType,
                                        width: int,
                                        precision: int,
                                        justify: OGRJustification]]) =
  for fdDefn in fdDefns:
    layer.createField(fdDefn.name, fdDefn.typ,
                      fdDefn.width, fdDefn.precision, fdDefn.justify)

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

proc fieldDefn*(ft: OGRFeatureH, idx: int): OGRFieldDefnH {.inline.} =
  result = ft.getFieldDefnRef(idx.cint)

# OGRFeatureDefnH
proc fieldCount*(ftDefn: OGRFeatureDefnH): int {.inline.} =
  result = ftDefn.getFieldCount

proc `[]`*(ftDefn: OGRFeatureDefnH, idx: int): OGRFieldDefnH {.inline.} =
  result = ftDefn.getFieldDefn(idx.cint)

proc `[]`*(ftDefn: OGRFeatureDefnH, name: string): OGRFieldDefnH {.inline.} =
  result = ftDefn.getFieldDefn(ftDefn.getFieldIndex(name))

iterator pairs*(ftDefn: OGRFeatureDefnH): tuple[key: int32, val: OGRFieldDefnH] =
  for i in 0 ..< ftDefn.getFieldCount:
    yield (i, ftDefn.getFieldDefn(i))

proc geomFieldCount*(ftDefn: OGRFeatureDefnH): int {.inline.} =
  result = ftDefn.getGeomFieldCount

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

template withFeature*(layer: OGRLayerH, feature: untyped, fid: int, body: untyped) =
  var feature = layer.getfeature(fid)
  if isNil(feature):
    quit("layer has not feature with FID: " & $fid)
  try:
    body
  finally:
    feature.destroy

template withCreateDataSource*(driver: OGRSFDriverH, ds: untyped,
                              fn: string, body: untyped) =
  var ds = driver.createDataSource(fn, nil)
  defer: ds.close
  body

template withCreateField*(layer: OGRLayerH, fieldDefn: untyped, 
                      name: string, typ: OGRFieldType, body: untyped) =
  var fieldDefn = create(name, typ)
  defer: fieldDefn.destroy
  body
  let error = layer.createField(fieldDefn, TRUE)
  if error != OGRERR_NONE:
    raiseAssert("Fail to create field")  

template withCreateFeature*(layer: OGRLayerH, feature: untyped, body: untyped) =
  var feature = layer.getLayerDefn.create()
  defer: feature.destroy
  body
  let error = layer.createFeature(feature)
  if error != OGRERR_NONE:
    raiseAssert("Fail to create feature")

template withSetGeometry*(feature: OGRFeatureH, geom: untyped,
                          typ: OGRwkbGeometryType, body: untyped) =
  var geom = createGeometry(typ)
  defer: geom.destroyGeometry
  body
  let error = feature.setGeometry(geom)
  if error != OGRERR_NONE:
    raiseAssert("Fail to set geometry")

template withSetGeometryDirectly*(feature: OGRFeatureH, geom: untyped,
                          typ: OGRwkbGeometryType, body: untyped) =
  var geom = createGeometry(typ)
  body
  let error = feature.setGeometryDirectly(geom)
  if error != OGRERR_NONE:
    raiseAssert("Fail to set geometry")