import wrap/gdal
import ogr
export gdal, ogr

proc `[]`*(ds: GDALDatasetH, idx: int): OGRLayerH =
  result = ds.getLayer(idx.cint)

proc `[]`*(ds: GDALDatasetH, name: string): OGRLayerH =
  result = ds.getLayerByName(name)

iterator items*(ds: GDALDatasetH): OGRLayerH =
  for i in 0 ..< ds.getLayerCount:
    yield ds.getLayer(i)
  
template withOpenEx*(hDS: untyped,
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


