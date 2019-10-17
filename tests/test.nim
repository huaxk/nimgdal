import gdal

const
  filename = "/mnt/d/sources/data/region_shp"

GDALAllRegister()
# withGDALOpenEx(ds, filename, GDAL_OF_VECTOR, nil, nil, nil):
# withGDALOpen(ds, filename, GA_ReadOnly):
withOGROpen(ds, filename, false, nil):
  let
    layer = ds.OGR_DS_GetLayer(0)
    # fDefn = layer.OGR_L_GetLayerDefn
    # fdCount = fDefn.OGR_FD_GetFieldCount
  # echo fieldCount
  echo ds.OGR_DS_GetLayerCount

  # for layer in ds:
  #   echo layer.OGR_L_GetName

  # for i in 0 ..< fdCount:
  #   let fdDefn = fDefn.OGR_FD_GetFieldDefn(i)
    # echo fdDefn.OGR_Fld_GetNameRef, ": ", fdDefn.OGR_Fld_GetType

  # for fdDefn in fDefn:
  #   echo fdDefn.OGR_Fld_GetNameRef, ": ", fdDefn.OGR_Fld_GetType

  for feature in layer:
    for i, fld in layer.OGR_L_GetLayerDefn:
      echo fld.OGR_Fld_GetNameRef
      case fld.OGR_Fld_GetType
      of OFTString: echo feature.OGR_F_GetFieldAsString(i)
      of OFTReal: echo feature.OGR_F_GetFieldAsDouble(i)
      of OFTInteger: echo feature.OGR_F_GetFieldAsInteger(i)
      else: echo feature.OGR_F_GetFieldAsString(i)

    let geometry = feature.OGR_F_GetGeometryRef
    if not isNil(geometry):
      echo geometry.OGR_G_GetGeometryType.OGRGeometryTypeToName

# var hPt = OGRGCreateGeometry(wkbPoint);

# proc main() =
#   const
#     filename = "C:/sources/data/region_shp"

#   registerAll()

#   withOpen(hDS, filename, OF_VECTOR, nil, nil, nil):
#     let hLayer = hDS.getLayer(0)
#     hLayer.resetReading
#     # let
#     #   hFDefn: FeatureDefn = hLayer.getLayerDefn
#       # fieldCount = hFDefn.getFieldCount

#     # for i in 0 ..< fieldCount:
#     #   let hFieldDefn = hFDefn.getFieldDefn(i)
#     #   echo hFieldDefn.getNameRef, ": ", hFieldDefn.getType

#     eachFeature(hFeature, hLayer):
#       # let fieldIndex = hFDefn.getFieldIndex("NAME_NONLA")
#       echo getStringField(hFeature, "NAME_NONLA")
#       # for i in 0 ..< fieldCount:
#       #   let hFieldDefn: FieldDefn = hFDefn.getFieldDefn(i)
#       #   echo hFieldDefn.getNameRef, ": "
#       #   case hFieldDefn.getType:
#       #     of Integer: echo hFeature.getFieldAsInteger(i)
#       #     of Integer64: echo hFeature.getFieldAsInteger64(i)
#       #     of Real: echo hFeature.getFieldAsDouble(i)         
#       #     of String: echo hFeature.getFieldAsString(i)
#       #     else: echo hFeature.getFieldAsString(i)

#       let hGeometry = hFeature.getGeometryRef
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
  