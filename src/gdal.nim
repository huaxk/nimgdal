import wrap/gdal
export gdal

# iterator items*(ds: OGRDataSourceH): OGRLayerH =
#   for i in 0 ..< ds.getLayerCount:
#     yield ds.getLayer(i)

# iterator items*(layer: OGRLayerH): OGRFeatureH =
#   layer.resetReading
#   while true:
#     var ft = layer.getNextFeature
#     if isNil(ft):
#       break
#     try:
#       yield ft
#     finally:
#       ft.destroy

# iterator items*(ft: OGRFeatureH): OGRGeometryH =
#   for i in ft.GetGeomFieldCount:
#     yield ft.GetGeomFieldRef(i)

# iterator pairs*(ftDefn: OGRFeatureDefnH): tuple[key: int32, val: OGRFieldDefnH] =
#   for i in 0 ..< ftDefn.getFieldCount:
#     yield (i, ftDefn.getFieldDefn(i))

# template withGDALOpen*(hDS: untyped,
#                   pszFilename: cstring,
#                   eAccess: GDALAccess,
#                   body: untyped) =
#   var hDS = Open(pszFilename, eAccess)
#   if isNil(hDS):
#     quit("Open failed: " & pszFilename)
#   try:
#     body
#   finally:
#     hDS.Close
  
template withGDALOpenEx*(hDS: untyped,
                  pszFilename: cstring,
                  nOpenFlags: int32,
                  papszAllowedDrivers: cstring,
                  papszOpenOptions: cstring,
                  papszSiblingFiles: cstring,
                  body: untyped) =
  var hDS = openEx(pszFilename, nOpenFlags, papszAllowedDrivers,
                papszOpenOptions, papszSiblingFiles)
  if isNil(hDS):
    quit("Open failed: " & pszFilename)
  try:
    body
  finally:
    hDS.close

# template withOGROpen*(hDS: untyped,
#                       pszName: string,
#                       bUpdate: bool,
#                       pahDriverList: OGRSFDriverH,
#                       body: untyped) =
#   var hDS = open(pszName, cint(bUpdate), pahDriverList)
#   if isNil(hDS):
#     quit("Open failed: " & pszName)
#   try:
#     body
#   finally:
#     hDS.destroy