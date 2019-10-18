import gdal

const
  filename = "/mnt/d/sources/data/region_shp"

AllRegister()
# withGDALOpenEx(ds, filename, GDAL_OF_VECTOR, nil, nil, nil):
# withGDALOpen(ds, filename, GA_ReadOnly):
withOGROpen(ds, filename, false, nil):
  let
    layer = ds.GetLayer(0)
    # fDefn = layer.OGR_L_GetLayerDefn
    # fdCount = fDefn.OGR_FD_GetFieldCount
  # echo fieldCount
  echo ds.GetLayerCount

  # for layer in ds:
  #   echo layer.OGR_L_GetName

  # for i in 0 ..< fdCount:
  #   let fdDefn = fDefn.OGR_FD_GetFieldDefn(i)
    # echo fdDefn.OGR_Fld_GetNameRef, ": ", fdDefn.OGR_Fld_GetType

  # for fdDefn in fDefn:
  #   echo fdDefn.OGR_Fld_GetNameRef, ": ", fdDefn.OGR_Fld_GetType

  for ft in layer:
    for i, fld in layer.GetLayerDefn:
      echo fld.OGR_Fld_GetNameRef
      case fld.OGR_Fld_GetType
      of OFTString: echo ft.GetFieldAsString(i)
      of OFTReal: echo ft.GetFieldAsDouble(i)
      of OFTInteger: echo ft.GetFieldAsInteger(i)
      else: echo ft.GetFieldAsString(i)

    let geometry = ft.GetGeometryRef
    if not isNil(geometry):
      echo geometry.GetGeometryType.OGRGeometryTypeToName

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
  