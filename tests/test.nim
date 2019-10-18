import gdal

const
  filename = "/mnt/d/sources/data/region_shp"

GDALAllRegister()
withGDALOpenEx(ds, filename, GDAL_OF_VECTOR, nil, nil, nil):
# withOGROpen(ds, filename, false, nil):
  let
    # layer = ds.GetLayer(0)
    layer = ds.GetLayerByName("CHN_adm0")
  echo ds.GetLayerCount
  echo layer.GetLayerDefn.GetName

  for ft in layer:
    for i, fld in layer.GetLayerDefn:
      echo fld.GetNameRef
      case fld.GetType
      of OFTString: echo ft.GetFieldAsString(i)
      of OFTReal: echo ft.GetFieldAsDouble(i)
      of OFTInteger: echo ft.GetFieldAsInteger(i)
      else: echo ft.GetFieldAsString(i)

    echo ft.GetGeomFieldCount
    let geometry = ft.GetGeomFieldRef(0)
    if not isNil(geometry):
      echo geometry.GetGeometryType.Flatten.GeometryTypeToName
      # echo geometry

# var hPt = OGRGCreateGeometry(wkbPoint);

# proc main() =
#   const
#     filename = "C:/sources/data/region_shp"

#   registerAll()

#   withOpen(hDS, filename, OF_VECTOR, nil, nil, nil):
#     let hLayer = hDS.getLayer(0)
#     hLayer.resetReading
#     # let
#     #   hFDefn: ftDefn = hLayer.getLayerDefn
#       # fieldCount = hFDefn.getFieldCount

#     # for i in 0 ..< fieldCount:
#     #   let hFieldDefn = hFDefn.getFieldDefn(i)
#     #   echo hFieldDefn.getNameRef, ": ", hFieldDefn.getType

#     eachft(hft, hLayer):
#       # let fieldIndex = hFDefn.getFieldIndex("NAME_NONLA")
#       echo getStringField(hft, "NAME_NONLA")
#       # for i in 0 ..< fieldCount:
#       #   let hFieldDefn: FieldDefn = hFDefn.getFieldDefn(i)
#       #   echo hFieldDefn.getNameRef, ": "
#       #   case hFieldDefn.getType:
#       #     of Integer: echo hft.getFieldAsInteger(i)
#       #     of Integer64: echo hft.getFieldAsInteger64(i)
#       #     of Real: echo hft.getFieldAsDouble(i)         
#       #     of String: echo hft.getFieldAsString(i)
#       #     else: echo hft.getFieldAsString(i)

#       let hGeometry = hft.getGeometryRef
#       if not isNil(hGeometry):
#         case hGeometry.getGeometryType.flatten:
#         of Point:
#           echo "point: ", hGeometry.getX(0), hGeometry.getY(0)
#         of LineString:
#           echo "linestring"
#         of Polygon:
#           echo "polygon"
#         of MultiPoint:
#           echo "multipoint"
#         of MultilineString:
#           echo "multiline"
#         of MultiPolygon:
#           echo "multipolygon"
#         of GeometryCollection:
#           echo "geometrycollection"
#         else:
#           echo "no point geometry"

# main()
  