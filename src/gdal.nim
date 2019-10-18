import wrap/gdal
export gdal

iterator items*(ds: OGRDataSourceH): OGRLayerH =
  for i in 0 ..< ds.GetLayerCount:
    yield ds.GetLayer(i)

iterator items*(layer: OGRLayerH): OGRFeatureH =
  layer.ResetReading
  while true:
    var ft = layer.GetNextFeature
    if isNil(ft):
      break
    try:
      yield ft
    finally:
      ft.Destroy

# proc items*(ft: OGRFeatureH): OGRGeometryH =
#   for i in ft.GetGeomFieldCount:
#     yield ft.GetGeomFieldRef(i)

iterator pairs*(ftDefn: OGRFeatureDefnH): tuple[key: int32, val: OGRFieldDefnH] =
  for i in 0 ..< ftDefn.GetFieldCount:
    yield (i, ftDefn.GetFieldDefn(i))

template withGDALOpen*(hDS: untyped,
                  pszFilename: cstring,
                  eAccess: GDALAccess,
                  body: untyped) =
  var hDS = Open(pszFilename, eAccess)
  if isNil(hDS):
    quit("Open failed: " & pszFilename)
  try:
    body
  finally:
    hDS.Close
  

template withGDALOpenEx*(hDS: untyped,
                  pszFilename: cstring,
                  nOpenFlags: int32,
                  papszAllowedDrivers: cstring,
                  papszOpenOptions: cstring,
                  papszSiblingFiles: cstring,
                  body: untyped) =
  var hDS = OpenEx(pszFilename, nOpenFlags, papszAllowedDrivers,
                papszOpenOptions, papszSiblingFiles)
  if isNil(hDS):
    quit("Open failed: " & pszFilename)
  try:
    body
  finally:
    hDS.Close

template withOGROpen*(hDS: untyped,
                      pszName: string,
                      bUpdate: bool,
                      pahDriverList: OGRSFDriverH,
                      body: untyped) =
  var hDS = Open(pszName, cint(bUpdate), pahDriverList)
  if isNil(hDS):
    quit("Open failed: " & pszName)
  try:
    body
  finally:
    hDS.Destroy