import cpl_port
import cpl_progress
import cpl_minixml
import ogr_core
export cpl_port
export cpl_progress
export cpl_minixml
export ogr_core
#import src/wrap/raw/cpl_progress
#import src/wrap/raw/cpl_minixml
#import src/wrap/raw/ogr_core
when defined(Windows):
  const dynlibogr_api = "libgdal.dll"

when defined(Linux):
  const dynlibogr_api = "libgdal.so"

when defined(MacOSX):
  const dynlibogr_api = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
type
  OGRGeometry = object
  OGRGeometryH* = ptr OGRGeometry
  OGRSpatialReference = object
  OGRSpatialReferenceH* = ptr OGRSpatialReference
  OGRCoordinateTransformation = object
  OGRCoordinateTransformationH* = ptr OGRCoordinateTransformation
#  _CPLXMLNode* {.bycopy.} = object


proc createFromWkb*(a1: ptr cuchar; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH; a4: cint): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromWkb", dynlib: dynlibogr_api.}
proc createFromWkt*(a1: cstringArray; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromWkt", dynlib: dynlibogr_api.}
proc createFromFgf*(a1: ptr cuchar; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH; a4: cint; a5: ptr cint): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromFgf", dynlib: dynlibogr_api.}
proc destroyGeometry*(a1: OGRGeometryH) {.stdcall,
    importc: "OGR_G_DestroyGeometry", dynlib: dynlibogr_api.}
proc createGeometry*(a1: OGRwkbGeometryType): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateGeometry", dynlib: dynlibogr_api.}
proc approximateArcAngles*(dfCenterX: cdouble; dfCenterY: cdouble;
                                dfZ: cdouble; dfPrimaryRadius: cdouble;
                                dfSecondaryAxis: cdouble; dfRotation: cdouble;
                                dfStartAngle: cdouble; dfEndAngle: cdouble;
                                dfMaxAngleStepSizeDegrees: cdouble): OGRGeometryH {.
    stdcall, importc: "OGR_G_ApproximateArcAngles", dynlib: dynlibogr_api.}
proc forceToPolygon*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToPolygon", dynlib: dynlibogr_api.}
proc forceToLineString*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToLineString", dynlib: dynlibogr_api.}
proc forceToMultiPolygon*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiPolygon", dynlib: dynlibogr_api.}
proc forceToMultiPoint*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiPoint", dynlib: dynlibogr_api.}
proc forceToMultiLineString*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiLineString", dynlib: dynlibogr_api.}
proc forceTo*(hGeom: OGRGeometryH; eTargetType: OGRwkbGeometryType;
                   papszOptions: cstringArray): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceTo", dynlib: dynlibogr_api.}
proc getDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetDimension", dynlib: dynlibogr_api.}
proc getCoordinateDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetCoordinateDimension", dynlib: dynlibogr_api.}
proc coordinateDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_CoordinateDimension", dynlib: dynlibogr_api.}
proc setCoordinateDimension*(a1: OGRGeometryH; a2: cint) {.stdcall,
    importc: "OGR_G_SetCoordinateDimension", dynlib: dynlibogr_api.}
proc is3D*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_Is3D",
                                       dynlib: dynlibogr_api.}
proc isMeasured*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_IsMeasured", dynlib: dynlibogr_api.}
proc set3D*(a1: OGRGeometryH; a2: cint) {.stdcall, importc: "OGR_G_Set3D",
    dynlib: dynlibogr_api.}
proc setMeasured*(a1: OGRGeometryH; a2: cint) {.stdcall,
    importc: "OGR_G_SetMeasured", dynlib: dynlibogr_api.}
proc clone*(a1: OGRGeometryH): OGRGeometryH {.stdcall, importc: "OGR_G_Clone",
    dynlib: dynlibogr_api.}
proc getEnvelope*(a1: OGRGeometryH; a2: ptr OGREnvelope) {.stdcall,
    importc: "OGR_G_GetEnvelope", dynlib: dynlibogr_api.}
proc getEnvelope3D*(a1: OGRGeometryH; a2: ptr OGREnvelope3D) {.stdcall,
    importc: "OGR_G_GetEnvelope3D", dynlib: dynlibogr_api.}
proc importFromWkb*(a1: OGRGeometryH; a2: ptr cuchar; a3: cint): OGRErr {.stdcall,
    importc: "OGR_G_ImportFromWkb", dynlib: dynlibogr_api.}
proc exportToWkb*(a1: OGRGeometryH; a2: OGRwkbByteOrder; a3: ptr cuchar): OGRErr {.
    stdcall, importc: "OGR_G_ExportToWkb", dynlib: dynlibogr_api.}
proc exportToIsoWkb*(a1: OGRGeometryH; a2: OGRwkbByteOrder; a3: ptr cuchar): OGRErr {.
    stdcall, importc: "OGR_G_ExportToIsoWkb", dynlib: dynlibogr_api.}
proc wkbSize*(hGeom: OGRGeometryH): cint {.stdcall, importc: "OGR_G_WkbSize",
    dynlib: dynlibogr_api.}
proc importFromWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ImportFromWkt", dynlib: dynlibogr_api.}
proc exportToWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ExportToWkt", dynlib: dynlibogr_api.}
proc exportToIsoWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ExportToIsoWkt", dynlib: dynlibogr_api.}
proc getGeometryType*(a1: OGRGeometryH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_G_GetGeometryType", dynlib: dynlibogr_api.}
proc getGeometryName*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_GetGeometryName", dynlib: dynlibogr_api.}
proc dumpReadable*(a1: OGRGeometryH; a2: ptr FILE; a3: cstring) {.stdcall,
    importc: "OGR_G_DumpReadable", dynlib: dynlibogr_api.}
proc flattenTo2D*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_FlattenTo2D",
    dynlib: dynlibogr_api.}
proc closeRings*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_CloseRings",
                                        dynlib: dynlibogr_api.}
proc createFromGML*(a1: cstring): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateFromGML", dynlib: dynlibogr_api.}
proc exportToGML*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_ExportToGML", dynlib: dynlibogr_api.}
proc exportToGMLEx*(a1: OGRGeometryH; papszOptions: cstringArray): cstring {.
    stdcall, importc: "OGR_G_ExportToGMLEx", dynlib: dynlibogr_api.}
proc createFromGMLTree*(a1: ptr CPLXMLNode): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateFromGMLTree", dynlib: dynlibogr_api.}
proc exportToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.stdcall,
    importc: "OGR_G_ExportToGMLTree", dynlib: dynlibogr_api.}
proc exportEnvelopeToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.stdcall,
    importc: "OGR_G_ExportEnvelopeToGMLTree", dynlib: dynlibogr_api.}
proc exportToKML*(a1: OGRGeometryH; pszAltitudeMode: cstring): cstring {.
    stdcall, importc: "OGR_G_ExportToKML", dynlib: dynlibogr_api.}
proc exportToJson*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_ExportToJson", dynlib: dynlibogr_api.}
proc exportToJsonEx*(a1: OGRGeometryH; papszOptions: cstringArray): cstring {.
    stdcall, importc: "OGR_G_ExportToJsonEx", dynlib: dynlibogr_api.}
proc createGeometryFromJson*(a1: cstring): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateGeometryFromJson", dynlib: dynlibogr_api.}
proc assignSpatialReference*(a1: OGRGeometryH; a2: OGRSpatialReferenceH) {.
    stdcall, importc: "OGR_G_AssignSpatialReference", dynlib: dynlibogr_api.}
proc getSpatialReference*(a1: OGRGeometryH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_G_GetSpatialReference", dynlib: dynlibogr_api.}
proc transform*(a1: OGRGeometryH; a2: OGRCoordinateTransformationH): OGRErr {.
    stdcall, importc: "OGR_G_Transform", dynlib: dynlibogr_api.}
proc transformTo*(a1: OGRGeometryH; a2: OGRSpatialReferenceH): OGRErr {.stdcall,
    importc: "OGR_G_TransformTo", dynlib: dynlibogr_api.}
proc simplify*(hThis: OGRGeometryH; tolerance: cdouble): OGRGeometryH {.stdcall,
    importc: "OGR_G_Simplify", dynlib: dynlibogr_api.}
proc simplifyPreserveTopology*(hThis: OGRGeometryH; tolerance: cdouble): OGRGeometryH {.
    stdcall, importc: "OGR_G_SimplifyPreserveTopology", dynlib: dynlibogr_api.}
proc delaunayTriangulation*(hThis: OGRGeometryH; dfTolerance: cdouble;
                                 bOnlyEdges: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_DelaunayTriangulation", dynlib: dynlibogr_api.}
proc segmentize*(hGeom: OGRGeometryH; dfMaxLength: cdouble) {.stdcall,
    importc: "OGR_G_Segmentize", dynlib: dynlibogr_api.}
proc intersects*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Intersects", dynlib: dynlibogr_api.}
proc equals*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Equals", dynlib: dynlibogr_api.}
proc disjoint*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Disjoint", dynlib: dynlibogr_api.}
proc touches*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Touches", dynlib: dynlibogr_api.}
proc crosses*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Crosses", dynlib: dynlibogr_api.}
proc within*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Within", dynlib: dynlibogr_api.}
proc contains*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Contains", dynlib: dynlibogr_api.}
proc overlaps*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Overlaps", dynlib: dynlibogr_api.}
proc boundary*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Boundary", dynlib: dynlibogr_api.}
proc convexHull*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ConvexHull", dynlib: dynlibogr_api.}
proc buffer*(a1: OGRGeometryH; a2: cdouble; a3: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_Buffer", dynlib: dynlibogr_api.}
proc intersection*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Intersection", dynlib: dynlibogr_api.}
proc union*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Union", dynlib: dynlibogr_api.}
proc unionCascaded*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_UnionCascaded", dynlib: dynlibogr_api.}
proc pointOnSurface*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_PointOnSurface", dynlib: dynlibogr_api.}
proc difference*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Difference", dynlib: dynlibogr_api.}
proc symDifference*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_SymDifference", dynlib: dynlibogr_api.}
proc distance*(a1: OGRGeometryH; a2: OGRGeometryH): cdouble {.stdcall,
    importc: "OGR_G_Distance", dynlib: dynlibogr_api.}
proc distance3D*(a1: OGRGeometryH; a2: OGRGeometryH): cdouble {.stdcall,
    importc: "OGR_G_Distance3D", dynlib: dynlibogr_api.}
proc length*(a1: OGRGeometryH): cdouble {.stdcall, importc: "OGR_G_Length",
    dynlib: dynlibogr_api.}
proc area*(a1: OGRGeometryH): cdouble {.stdcall, importc: "OGR_G_Area",
    dynlib: dynlibogr_api.}
proc centroid*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Centroid", dynlib: dynlibogr_api.}
proc value*(a1: OGRGeometryH; dfDistance: cdouble): OGRGeometryH {.stdcall,
    importc: "OGR_G_Value", dynlib: dynlibogr_api.}
proc empty*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_Empty",
                                   dynlib: dynlibogr_api.}
proc isEmpty*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsEmpty",
    dynlib: dynlibogr_api.}
proc isValid*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsValid",
    dynlib: dynlibogr_api.}
proc isSimple*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsSimple",
    dynlib: dynlibogr_api.}
proc isRing*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsRing",
    dynlib: dynlibogr_api.}
proc polygonize*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Polygonize", dynlib: dynlibogr_api.}
proc getPointCount*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetPointCount", dynlib: dynlibogr_api.}
proc getPoints*(hGeom: OGRGeometryH; pabyX: pointer; nXStride: cint;
                     pabyY: pointer; nYStride: cint; pabyZ: pointer; nZStride: cint): cint {.
    stdcall, importc: "OGR_G_GetPoints", dynlib: dynlibogr_api.}
proc getPointsZM*(hGeom: OGRGeometryH; pabyX: pointer; nXStride: cint;
                       pabyY: pointer; nYStride: cint; pabyZ: pointer; nZStride: cint;
                       pabyM: pointer; nMStride: cint): cint {.stdcall,
    importc: "OGR_G_GetPointsZM", dynlib: dynlibogr_api.}
proc getX*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetX",
    dynlib: dynlibogr_api.}
proc getY*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetY",
    dynlib: dynlibogr_api.}
proc getZ*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetZ",
    dynlib: dynlibogr_api.}
proc getM*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetM",
    dynlib: dynlibogr_api.}
proc getPoint*(a1: OGRGeometryH; iPoint: cint; a3: ptr cdouble; a4: ptr cdouble;
                    a5: ptr cdouble) {.stdcall, importc: "OGR_G_GetPoint",
                                    dynlib: dynlibogr_api.}
proc getPointZM*(a1: OGRGeometryH; iPoint: cint; a3: ptr cdouble; a4: ptr cdouble;
                      a5: ptr cdouble; a6: ptr cdouble) {.stdcall,
    importc: "OGR_G_GetPointZM", dynlib: dynlibogr_api.}
proc setPointCount*(hGeom: OGRGeometryH; nNewPointCount: cint) {.stdcall,
    importc: "OGR_G_SetPointCount", dynlib: dynlibogr_api.}
proc setPoint*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                    a5: cdouble) {.stdcall, importc: "OGR_G_SetPoint",
                                 dynlib: dynlibogr_api.}
proc setPoint_2D*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble) {.
    stdcall, importc: "OGR_G_SetPoint_2D", dynlib: dynlibogr_api.}
proc setPointM*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                     a5: cdouble) {.stdcall, importc: "OGR_G_SetPointM",
                                  dynlib: dynlibogr_api.}
proc setPointZM*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                      a5: cdouble; a6: cdouble) {.stdcall,
    importc: "OGR_G_SetPointZM", dynlib: dynlibogr_api.}
proc addPoint*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble) {.stdcall,
    importc: "OGR_G_AddPoint", dynlib: dynlibogr_api.}
proc addPoint_2D*(a1: OGRGeometryH; a2: cdouble; a3: cdouble) {.stdcall,
    importc: "OGR_G_AddPoint_2D", dynlib: dynlibogr_api.}
proc addPointM*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble) {.stdcall,
    importc: "OGR_G_AddPointM", dynlib: dynlibogr_api.}
proc addPointZM*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble;
                      a5: cdouble) {.stdcall, importc: "OGR_G_AddPointZM",
                                   dynlib: dynlibogr_api.}
proc setPoints*(hGeom: OGRGeometryH; nPointsIn: cint; pabyX: pointer;
                     nXStride: cint; pabyY: pointer; nYStride: cint; pabyZ: pointer;
                     nZStride: cint) {.stdcall, importc: "OGR_G_SetPoints",
                                     dynlib: dynlibogr_api.}
proc setPointsZM*(hGeom: OGRGeometryH; nPointsIn: cint; pabyX: pointer;
                       nXStride: cint; pabyY: pointer; nYStride: cint; pabyZ: pointer;
                       nZStride: cint; pabyM: pointer; nMStride: cint) {.stdcall,
    importc: "OGR_G_SetPointsZM", dynlib: dynlibogr_api.}
proc getGeometryCount*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetGeometryCount", dynlib: dynlibogr_api.}
proc getGeometryRef*(a1: OGRGeometryH; a2: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_GetGeometryRef", dynlib: dynlibogr_api.}
proc addGeometry*(a1: OGRGeometryH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_AddGeometry", dynlib: dynlibogr_api.}
proc addGeometryDirectly*(a1: OGRGeometryH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_AddGeometryDirectly", dynlib: dynlibogr_api.}
proc removeGeometry*(a1: OGRGeometryH; a2: cint; a3: cint): OGRErr {.stdcall,
    importc: "OGR_G_RemoveGeometry", dynlib: dynlibogr_api.}
proc hasCurveGeometry*(a1: OGRGeometryH; bLookForNonLinear: cint): cint {.
    stdcall, importc: "OGR_G_HasCurveGeometry", dynlib: dynlibogr_api.}
proc getLinearGeometry*(hGeom: OGRGeometryH;
                             dfMaxAngleStepSizeDegrees: cdouble;
                             papszOptions: cstringArray): OGRGeometryH {.stdcall,
    importc: "OGR_G_GetLinearGeometry", dynlib: dynlibogr_api.}
proc getCurveGeometry*(hGeom: OGRGeometryH; papszOptions: cstringArray): OGRGeometryH {.
    stdcall, importc: "OGR_G_GetCurveGeometry", dynlib: dynlibogr_api.}
proc buildPolygonFromEdges*(hLinesAsCollection: OGRGeometryH; bBestEffort: cint;
                              bAutoClose: cint; dfTolerance: cdouble;
                              peErr: ptr OGRErr): OGRGeometryH {.stdcall,
    importc: "OGRBuildPolygonFromEdges", dynlib: dynlibogr_api.}
proc setGenerate_DB2_V72_BYTE_ORDER*(bGenerate_DB2_V72_BYTE_ORDER: cint): OGRErr {.
    stdcall, importc: "OGRSetGenerate_DB2_V72_BYTE_ORDER", dynlib: dynlibogr_api.}
proc getGenerate_DB2_V72_BYTE_ORDER*(): cint {.stdcall,
    importc: "OGRGetGenerate_DB2_V72_BYTE_ORDER", dynlib: dynlibogr_api.}
proc setNonLinearGeometriesEnabledFlag*(bFlag: cint) {.stdcall,
    importc: "OGRSetNonLinearGeometriesEnabledFlag", dynlib: dynlibogr_api.}
proc getNonLinearGeometriesEnabledFlag*(): cint {.stdcall,
    importc: "OGRGetNonLinearGeometriesEnabledFlag", dynlib: dynlibogr_api.}
type
  OGRFieldDefn = object
  OGRFieldDefnH* = ptr OGRFieldDefn
  OGRFeatureDefn = object
  OGRFeatureDefnH* = ptr OGRFeatureDefn
  OGRFeature = object
  OGRFeatureH* = ptr OGRFeature
  OGRStyleTable = object
  OGRStyleTableH* = ptr OGRStyleTable
  OGRGeomFieldDefn = object
  OGRGeomFieldDefnH* = ptr OGRGeomFieldDefn

proc create*(a1: cstring; a2: OGRFieldType): OGRFieldDefnH {.stdcall,
    importc: "OGR_Fld_Create", dynlib: dynlibogr_api.}
proc destroy*(a1: OGRFieldDefnH) {.stdcall, importc: "OGR_Fld_Destroy",
                                        dynlib: dynlibogr_api.}
proc setName*(a1: OGRFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_Fld_SetName", dynlib: dynlibogr_api.}
proc getNameRef*(a1: OGRFieldDefnH): cstring {.stdcall,
    importc: "OGR_Fld_GetNameRef", dynlib: dynlibogr_api.}
proc getType*(a1: OGRFieldDefnH): OGRFieldType {.stdcall,
    importc: "OGR_Fld_GetType", dynlib: dynlibogr_api.}
proc setType*(a1: OGRFieldDefnH; a2: OGRFieldType) {.stdcall,
    importc: "OGR_Fld_SetType", dynlib: dynlibogr_api.}
proc getSubType*(a1: OGRFieldDefnH): OGRFieldSubType {.stdcall,
    importc: "OGR_Fld_GetSubType", dynlib: dynlibogr_api.}
proc setSubType*(a1: OGRFieldDefnH; a2: OGRFieldSubType) {.stdcall,
    importc: "OGR_Fld_SetSubType", dynlib: dynlibogr_api.}
proc getJustify*(a1: OGRFieldDefnH): OGRJustification {.stdcall,
    importc: "OGR_Fld_GetJustify", dynlib: dynlibogr_api.}
proc setJustify*(a1: OGRFieldDefnH; a2: OGRJustification) {.stdcall,
    importc: "OGR_Fld_SetJustify", dynlib: dynlibogr_api.}
proc getWidth*(a1: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_GetWidth", dynlib: dynlibogr_api.}
proc setWidth*(a1: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetWidth", dynlib: dynlibogr_api.}
proc getPrecision*(a1: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_GetPrecision", dynlib: dynlibogr_api.}
proc setPrecision*(a1: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetPrecision", dynlib: dynlibogr_api.}
proc set*(a1: OGRFieldDefnH; a2: cstring; a3: OGRFieldType; a4: cint; a5: cint;
                 a6: OGRJustification) {.stdcall, importc: "OGR_Fld_Set",
                                       dynlib: dynlibogr_api.}
proc isIgnored*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsIgnored", dynlib: dynlibogr_api.}
proc setIgnored*(hDefn: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetIgnored", dynlib: dynlibogr_api.}
proc isNullable*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsNullable", dynlib: dynlibogr_api.}
proc setNullable*(hDefn: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetNullable", dynlib: dynlibogr_api.}
proc getDefault*(hDefn: OGRFieldDefnH): cstring {.stdcall,
    importc: "OGR_Fld_GetDefault", dynlib: dynlibogr_api.}
proc setDefault*(hDefn: OGRFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_Fld_SetDefault", dynlib: dynlibogr_api.}
proc isDefaultDriverSpecific*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsDefaultDriverSpecific", dynlib: dynlibogr_api.}
proc getFieldTypeName*(a1: OGRFieldType): cstring {.stdcall,
    importc: "OGR_GetFieldTypeName", dynlib: dynlibogr_api.}
proc getFieldSubTypeName*(a1: OGRFieldSubType): cstring {.stdcall,
    importc: "OGR_GetFieldSubTypeName", dynlib: dynlibogr_api.}
proc areTypeSubTypeCompatible*(eType: OGRFieldType; eSubType: OGRFieldSubType): cint {.
    stdcall, importc: "OGR_AreTypeSubTypeCompatible", dynlib: dynlibogr_api.}
proc gFld_Create*(a1: cstring; a2: OGRwkbGeometryType): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_GFld_Create", dynlib: dynlibogr_api.}
proc gFld_Destroy*(a1: OGRGeomFieldDefnH) {.stdcall,
    importc: "OGR_GFld_Destroy", dynlib: dynlibogr_api.}
proc gFld_SetName*(a1: OGRGeomFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_GFld_SetName", dynlib: dynlibogr_api.}
proc gFld_GetNameRef*(a1: OGRGeomFieldDefnH): cstring {.stdcall,
    importc: "OGR_GFld_GetNameRef", dynlib: dynlibogr_api.}
proc gFld_GetType*(a1: OGRGeomFieldDefnH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GFld_GetType", dynlib: dynlibogr_api.}
proc gFld_SetType*(a1: OGRGeomFieldDefnH; a2: OGRwkbGeometryType) {.stdcall,
    importc: "OGR_GFld_SetType", dynlib: dynlibogr_api.}
proc gFld_GetSpatialRef*(a1: OGRGeomFieldDefnH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_GFld_GetSpatialRef", dynlib: dynlibogr_api.}
proc gFld_SetSpatialRef*(a1: OGRGeomFieldDefnH; hSRS: OGRSpatialReferenceH) {.
    stdcall, importc: "OGR_GFld_SetSpatialRef", dynlib: dynlibogr_api.}
proc gFld_IsNullable*(hDefn: OGRGeomFieldDefnH): cint {.stdcall,
    importc: "OGR_GFld_IsNullable", dynlib: dynlibogr_api.}
proc gFld_SetNullable*(hDefn: OGRGeomFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_GFld_SetNullable", dynlib: dynlibogr_api.}
proc gFld_IsIgnored*(hDefn: OGRGeomFieldDefnH): cint {.stdcall,
    importc: "OGR_GFld_IsIgnored", dynlib: dynlibogr_api.}
proc gFld_SetIgnored*(hDefn: OGRGeomFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_GFld_SetIgnored", dynlib: dynlibogr_api.}
proc create*(a1: cstring): OGRFeatureDefnH {.stdcall,
    importc: "OGR_FD_Create", dynlib: dynlibogr_api.}
proc destroy*(a1: OGRFeatureDefnH) {.stdcall, importc: "OGR_FD_Destroy",
    dynlib: dynlibogr_api.}
proc release*(a1: OGRFeatureDefnH) {.stdcall, importc: "OGR_FD_Release",
    dynlib: dynlibogr_api.}
proc getName*(a1: OGRFeatureDefnH): cstring {.stdcall,
    importc: "OGR_FD_GetName", dynlib: dynlibogr_api.}
proc getFieldCount*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetFieldCount", dynlib: dynlibogr_api.}
proc getFieldDefn*(a1: OGRFeatureDefnH; a2: cint): OGRFieldDefnH {.stdcall,
    importc: "OGR_FD_GetFieldDefn", dynlib: dynlibogr_api.}
proc getFieldIndex*(a1: OGRFeatureDefnH; a2: cstring): cint {.stdcall,
    importc: "OGR_FD_GetFieldIndex", dynlib: dynlibogr_api.}
proc addFieldDefn*(a1: OGRFeatureDefnH; a2: OGRFieldDefnH) {.stdcall,
    importc: "OGR_FD_AddFieldDefn", dynlib: dynlibogr_api.}
proc deleteFieldDefn*(hDefn: OGRFeatureDefnH; iField: cint): OGRErr {.stdcall,
    importc: "OGR_FD_DeleteFieldDefn", dynlib: dynlibogr_api.}
proc reorderFieldDefns*(hDefn: OGRFeatureDefnH; panMap: ptr cint): OGRErr {.
    stdcall, importc: "OGR_FD_ReorderFieldDefns", dynlib: dynlibogr_api.}
proc getGeomType*(a1: OGRFeatureDefnH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_FD_GetGeomType", dynlib: dynlibogr_api.}
proc setGeomType*(a1: OGRFeatureDefnH; a2: OGRwkbGeometryType) {.stdcall,
    importc: "OGR_FD_SetGeomType", dynlib: dynlibogr_api.}
proc isGeometryIgnored*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_IsGeometryIgnored", dynlib: dynlibogr_api.}
proc setGeometryIgnored*(a1: OGRFeatureDefnH; a2: cint) {.stdcall,
    importc: "OGR_FD_SetGeometryIgnored", dynlib: dynlibogr_api.}
proc isStyleIgnored*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_IsStyleIgnored", dynlib: dynlibogr_api.}
proc setStyleIgnored*(a1: OGRFeatureDefnH; a2: cint) {.stdcall,
    importc: "OGR_FD_SetStyleIgnored", dynlib: dynlibogr_api.}
proc reference*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_Reference", dynlib: dynlibogr_api.}
proc dereference*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_Dereference", dynlib: dynlibogr_api.}
proc getReferenceCount*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetReferenceCount", dynlib: dynlibogr_api.}
proc getGeomFieldCount*(hFDefn: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetGeomFieldCount", dynlib: dynlibogr_api.}
proc getGeomFieldDefn*(hFDefn: OGRFeatureDefnH; i: cint): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_FD_GetGeomFieldDefn", dynlib: dynlibogr_api.}
proc getGeomFieldIndex*(hFDefn: OGRFeatureDefnH; pszName: cstring): cint {.
    stdcall, importc: "OGR_FD_GetGeomFieldIndex", dynlib: dynlibogr_api.}
proc addGeomFieldDefn*(hFDefn: OGRFeatureDefnH; hGFldDefn: OGRGeomFieldDefnH) {.
    stdcall, importc: "OGR_FD_AddGeomFieldDefn", dynlib: dynlibogr_api.}
proc deleteGeomFieldDefn*(hFDefn: OGRFeatureDefnH; iGeomField: cint): OGRErr {.
    stdcall, importc: "OGR_FD_DeleteGeomFieldDefn", dynlib: dynlibogr_api.}
proc isSame*(hFDefn: OGRFeatureDefnH; hOtherFDefn: OGRFeatureDefnH): cint {.
    stdcall, importc: "OGR_FD_IsSame", dynlib: dynlibogr_api.}
proc create*(a1: OGRFeatureDefnH): OGRFeatureH {.stdcall,
    importc: "OGR_F_Create", dynlib: dynlibogr_api.}
proc destroy*(a1: OGRFeatureH) {.stdcall, importc: "OGR_F_Destroy",
                                    dynlib: dynlibogr_api.}
proc getDefnRef*(a1: OGRFeatureH): OGRFeatureDefnH {.stdcall,
    importc: "OGR_F_GetDefnRef", dynlib: dynlibogr_api.}
proc setGeometryDirectly*(a1: OGRFeatureH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeometryDirectly", dynlib: dynlibogr_api.}
proc setGeometry*(a1: OGRFeatureH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeometry", dynlib: dynlibogr_api.}
proc getGeometryRef*(a1: OGRFeatureH): OGRGeometryH {.stdcall,
    importc: "OGR_F_GetGeometryRef", dynlib: dynlibogr_api.}
proc stealGeometry*(a1: OGRFeatureH): OGRGeometryH {.stdcall,
    importc: "OGR_F_StealGeometry", dynlib: dynlibogr_api.}
proc clone*(a1: OGRFeatureH): OGRFeatureH {.stdcall, importc: "OGR_F_Clone",
    dynlib: dynlibogr_api.}
proc equal*(a1: OGRFeatureH; a2: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_Equal", dynlib: dynlibogr_api.}
proc getFieldCount*(a1: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_GetFieldCount", dynlib: dynlibogr_api.}
proc getFieldDefnRef*(a1: OGRFeatureH; a2: cint): OGRFieldDefnH {.stdcall,
    importc: "OGR_F_GetFieldDefnRef", dynlib: dynlibogr_api.}
proc getFieldIndex*(a1: OGRFeatureH; a2: cstring): cint {.stdcall,
    importc: "OGR_F_GetFieldIndex", dynlib: dynlibogr_api.}
proc isFieldSet*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldSet", dynlib: dynlibogr_api.}
proc unsetField*(a1: OGRFeatureH; a2: cint) {.stdcall,
    importc: "OGR_F_UnsetField", dynlib: dynlibogr_api.}
proc isFieldNull*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldNull", dynlib: dynlibogr_api.}
proc isFieldSetAndNotNull*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldSetAndNotNull", dynlib: dynlibogr_api.}
proc setFieldNull*(a1: OGRFeatureH; a2: cint) {.stdcall,
    importc: "OGR_F_SetFieldNull", dynlib: dynlibogr_api.}
proc getRawFieldRef*(a1: OGRFeatureH; a2: cint): ptr OGRField {.stdcall,
    importc: "OGR_F_GetRawFieldRef", dynlib: dynlibogr_api.}
proc rawField_IsUnset*(a1: ptr OGRField): cint {.stdcall,
    importc: "OGR_RawField_IsUnset", dynlib: dynlibogr_api.}
proc rawField_IsNull*(a1: ptr OGRField): cint {.stdcall,
    importc: "OGR_RawField_IsNull", dynlib: dynlibogr_api.}
proc rawField_SetUnset*(a1: ptr OGRField) {.stdcall,
    importc: "OGR_RawField_SetUnset", dynlib: dynlibogr_api.}
proc rawField_SetNull*(a1: ptr OGRField) {.stdcall,
    importc: "OGR_RawField_SetNull", dynlib: dynlibogr_api.}
proc getFieldAsInteger*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsInteger", dynlib: dynlibogr_api.}
proc getFieldAsInteger64*(a1: OGRFeatureH; a2: cint): GIntBig {.stdcall,
    importc: "OGR_F_GetFieldAsInteger64", dynlib: dynlibogr_api.}
proc getFieldAsDouble*(a1: OGRFeatureH; a2: cint): cdouble {.stdcall,
    importc: "OGR_F_GetFieldAsDouble", dynlib: dynlibogr_api.}
proc getFieldAsString*(a1: OGRFeatureH; a2: cint): cstring {.stdcall,
    importc: "OGR_F_GetFieldAsString", dynlib: dynlibogr_api.}
proc getFieldAsIntegerList*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr cint {.
    stdcall, importc: "OGR_F_GetFieldAsIntegerList", dynlib: dynlibogr_api.}
proc getFieldAsInteger64List*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr GIntBig {.
    stdcall, importc: "OGR_F_GetFieldAsInteger64List", dynlib: dynlibogr_api.}
proc getFieldAsDoubleList*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr cdouble {.
    stdcall, importc: "OGR_F_GetFieldAsDoubleList", dynlib: dynlibogr_api.}
proc getFieldAsStringList*(a1: OGRFeatureH; a2: cint): cstringArray {.stdcall,
    importc: "OGR_F_GetFieldAsStringList", dynlib: dynlibogr_api.}
proc getFieldAsBinary*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr GByte {.
    stdcall, importc: "OGR_F_GetFieldAsBinary", dynlib: dynlibogr_api.}
proc getFieldAsDateTime*(a1: OGRFeatureH; a2: cint; a3: ptr cint; a4: ptr cint;
                              a5: ptr cint; a6: ptr cint; a7: ptr cint; a8: ptr cint;
                              a9: ptr cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsDateTime", dynlib: dynlibogr_api.}
proc getFieldAsDateTimeEx*(hFeat: OGRFeatureH; iField: cint; pnYear: ptr cint;
                                pnMonth: ptr cint; pnDay: ptr cint; pnHour: ptr cint;
                                pnMinute: ptr cint; pfSecond: ptr cfloat;
                                pnTZFlag: ptr cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsDateTimeEx", dynlib: dynlibogr_api.}
proc setFieldInteger*(a1: OGRFeatureH; a2: cint; a3: cint) {.stdcall,
    importc: "OGR_F_SetFieldInteger", dynlib: dynlibogr_api.}
proc setFieldInteger64*(a1: OGRFeatureH; a2: cint; a3: GIntBig) {.stdcall,
    importc: "OGR_F_SetFieldInteger64", dynlib: dynlibogr_api.}
proc setFieldDouble*(a1: OGRFeatureH; a2: cint; a3: cdouble) {.stdcall,
    importc: "OGR_F_SetFieldDouble", dynlib: dynlibogr_api.}
proc setFieldString*(a1: OGRFeatureH; a2: cint; a3: cstring) {.stdcall,
    importc: "OGR_F_SetFieldString", dynlib: dynlibogr_api.}
proc setFieldIntegerList*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr cint) {.
    stdcall, importc: "OGR_F_SetFieldIntegerList", dynlib: dynlibogr_api.}
proc setFieldInteger64List*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr GIntBig) {.
    stdcall, importc: "OGR_F_SetFieldInteger64List", dynlib: dynlibogr_api.}
proc setFieldDoubleList*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr cdouble) {.
    stdcall, importc: "OGR_F_SetFieldDoubleList", dynlib: dynlibogr_api.}
proc setFieldStringList*(a1: OGRFeatureH; a2: cint; a3: cstringArray) {.stdcall,
    importc: "OGR_F_SetFieldStringList", dynlib: dynlibogr_api.}
proc setFieldRaw*(a1: OGRFeatureH; a2: cint; a3: ptr OGRField) {.stdcall,
    importc: "OGR_F_SetFieldRaw", dynlib: dynlibogr_api.}
proc setFieldBinary*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr GByte) {.stdcall,
    importc: "OGR_F_SetFieldBinary", dynlib: dynlibogr_api.}
proc setFieldDateTime*(a1: OGRFeatureH; a2: cint; a3: cint; a4: cint; a5: cint;
                            a6: cint; a7: cint; a8: cint; a9: cint) {.stdcall,
    importc: "OGR_F_SetFieldDateTime", dynlib: dynlibogr_api.}
proc setFieldDateTimeEx*(a1: OGRFeatureH; a2: cint; a3: cint; a4: cint; a5: cint;
                              a6: cint; a7: cint; a8: cfloat; a9: cint) {.stdcall,
    importc: "OGR_F_SetFieldDateTimeEx", dynlib: dynlibogr_api.}
proc getGeomFieldCount*(hFeat: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_GetGeomFieldCount", dynlib: dynlibogr_api.}
proc getGeomFieldDefnRef*(hFeat: OGRFeatureH; iField: cint): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_F_GetGeomFieldDefnRef", dynlib: dynlibogr_api.}
proc getGeomFieldIndex*(hFeat: OGRFeatureH; pszName: cstring): cint {.stdcall,
    importc: "OGR_F_GetGeomFieldIndex", dynlib: dynlibogr_api.}
proc getGeomFieldRef*(hFeat: OGRFeatureH; iField: cint): OGRGeometryH {.stdcall,
    importc: "OGR_F_GetGeomFieldRef", dynlib: dynlibogr_api.}
proc setGeomFieldDirectly*(hFeat: OGRFeatureH; iField: cint;
                                hGeom: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeomFieldDirectly", dynlib: dynlibogr_api.}
proc setGeomField*(hFeat: OGRFeatureH; iField: cint; hGeom: OGRGeometryH): OGRErr {.
    stdcall, importc: "OGR_F_SetGeomField", dynlib: dynlibogr_api.}
proc getFID*(a1: OGRFeatureH): GIntBig {.stdcall, importc: "OGR_F_GetFID",
    dynlib: dynlibogr_api.}
proc setFID*(a1: OGRFeatureH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_F_SetFID", dynlib: dynlibogr_api.}
proc dumpReadable*(a1: OGRFeatureH; a2: ptr FILE) {.stdcall,
    importc: "OGR_F_DumpReadable", dynlib: dynlibogr_api.}
proc setFrom*(a1: OGRFeatureH; a2: OGRFeatureH; a3: cint): OGRErr {.stdcall,
    importc: "OGR_F_SetFrom", dynlib: dynlibogr_api.}
proc setFromWithMap*(a1: OGRFeatureH; a2: OGRFeatureH; a3: cint; a4: ptr cint): OGRErr {.
    stdcall, importc: "OGR_F_SetFromWithMap", dynlib: dynlibogr_api.}
proc getStyleString*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetStyleString", dynlib: dynlibogr_api.}
proc setStyleString*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetStyleString", dynlib: dynlibogr_api.}
proc setStyleStringDirectly*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetStyleStringDirectly", dynlib: dynlibogr_api.}
proc getStyleTable*(a1: OGRFeatureH): OGRStyleTableH {.stdcall,
    importc: "OGR_F_GetStyleTable", dynlib: dynlibogr_api.}
proc setStyleTableDirectly*(a1: OGRFeatureH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_F_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc setStyleTable*(a1: OGRFeatureH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_F_SetStyleTable", dynlib: dynlibogr_api.}
proc getNativeData*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetNativeData", dynlib: dynlibogr_api.}
proc setNativeData*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetNativeData", dynlib: dynlibogr_api.}
proc getNativeMediaType*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetNativeMediaType", dynlib: dynlibogr_api.}
proc setNativeMediaType*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetNativeMediaType", dynlib: dynlibogr_api.}
proc fillUnsetWithDefault*(hFeat: OGRFeatureH; bNotNullableOnly: cint;
                                papszOptions: cstringArray) {.stdcall,
    importc: "OGR_F_FillUnsetWithDefault", dynlib: dynlibogr_api.}
proc validate*(a1: OGRFeatureH; nValidateFlags: cint; bEmitError: cint): cint {.
    stdcall, importc: "OGR_F_Validate", dynlib: dynlibogr_api.}
type
  OGRLayer = object
  OGRLayerH* = ptr OGRLayer
  OGRDataSource = object
  OGRDataSourceH* = ptr OGRDataSource
  OGRSFDriver = object
  OGRSFDriverH* = ptr OGRSFDriver

proc getName*(a1: OGRLayerH): cstring {.stdcall, importc: "OGR_L_GetName",
    dynlib: dynlibogr_api.}
proc getGeomType*(a1: OGRLayerH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_L_GetGeomType", dynlib: dynlibogr_api.}
proc getSpatialFilter*(a1: OGRLayerH): OGRGeometryH {.stdcall,
    importc: "OGR_L_GetSpatialFilter", dynlib: dynlibogr_api.}
proc setSpatialFilter*(a1: OGRLayerH; a2: OGRGeometryH) {.stdcall,
    importc: "OGR_L_SetSpatialFilter", dynlib: dynlibogr_api.}
proc setSpatialFilterRect*(a1: OGRLayerH; a2: cdouble; a3: cdouble; a4: cdouble;
                                a5: cdouble) {.stdcall,
    importc: "OGR_L_SetSpatialFilterRect", dynlib: dynlibogr_api.}
proc setSpatialFilterEx*(a1: OGRLayerH; iGeomField: cint; hGeom: OGRGeometryH) {.
    stdcall, importc: "OGR_L_SetSpatialFilterEx", dynlib: dynlibogr_api.}
proc setSpatialFilterRectEx*(a1: OGRLayerH; iGeomField: cint; dfMinX: cdouble;
                                  dfMinY: cdouble; dfMaxX: cdouble; dfMaxY: cdouble) {.
    stdcall, importc: "OGR_L_SetSpatialFilterRectEx", dynlib: dynlibogr_api.}
proc setAttributeFilter*(a1: OGRLayerH; a2: cstring): OGRErr {.stdcall,
    importc: "OGR_L_SetAttributeFilter", dynlib: dynlibogr_api.}
proc resetReading*(a1: OGRLayerH) {.stdcall, importc: "OGR_L_ResetReading",
                                       dynlib: dynlibogr_api.}
proc getNextFeature*(a1: OGRLayerH): OGRFeatureH {.stdcall,
    importc: "OGR_L_GetNextFeature", dynlib: dynlibogr_api.}
proc setNextByIndex*(a1: OGRLayerH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_L_SetNextByIndex", dynlib: dynlibogr_api.}
proc getFeature*(a1: OGRLayerH; a2: GIntBig): OGRFeatureH {.stdcall,
    importc: "OGR_L_GetFeature", dynlib: dynlibogr_api.}
proc setFeature*(a1: OGRLayerH; a2: OGRFeatureH): OGRErr {.stdcall,
    importc: "OGR_L_SetFeature", dynlib: dynlibogr_api.}
proc createFeature*(a1: OGRLayerH; a2: OGRFeatureH): OGRErr {.stdcall,
    importc: "OGR_L_CreateFeature", dynlib: dynlibogr_api.}
proc deleteFeature*(a1: OGRLayerH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_L_DeleteFeature", dynlib: dynlibogr_api.}
proc getLayerDefn*(a1: OGRLayerH): OGRFeatureDefnH {.stdcall,
    importc: "OGR_L_GetLayerDefn", dynlib: dynlibogr_api.}
proc getSpatialRef*(a1: OGRLayerH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_L_GetSpatialRef", dynlib: dynlibogr_api.}
proc findFieldIndex*(a1: OGRLayerH; a2: cstring; bExactMatch: cint): cint {.
    stdcall, importc: "OGR_L_FindFieldIndex", dynlib: dynlibogr_api.}
proc getFeatureCount*(a1: OGRLayerH; a2: cint): GIntBig {.stdcall,
    importc: "OGR_L_GetFeatureCount", dynlib: dynlibogr_api.}
proc getExtent*(a1: OGRLayerH; a2: ptr OGREnvelope; a3: cint): OGRErr {.stdcall,
    importc: "OGR_L_GetExtent", dynlib: dynlibogr_api.}
proc getExtentEx*(a1: OGRLayerH; iGeomField: cint; psExtent: ptr OGREnvelope;
                       bForce: cint): OGRErr {.stdcall,
    importc: "OGR_L_GetExtentEx", dynlib: dynlibogr_api.}
proc testCapability*(a1: OGRLayerH; a2: cstring): cint {.stdcall,
    importc: "OGR_L_TestCapability", dynlib: dynlibogr_api.}
proc createField*(a1: OGRLayerH; a2: OGRFieldDefnH; a3: cint): OGRErr {.stdcall,
    importc: "OGR_L_CreateField", dynlib: dynlibogr_api.}
proc createGeomField*(hLayer: OGRLayerH; hFieldDefn: OGRGeomFieldDefnH;
                           bForce: cint): OGRErr {.stdcall,
    importc: "OGR_L_CreateGeomField", dynlib: dynlibogr_api.}
proc deleteField*(a1: OGRLayerH; iField: cint): OGRErr {.stdcall,
    importc: "OGR_L_DeleteField", dynlib: dynlibogr_api.}
proc reorderFields*(a1: OGRLayerH; panMap: ptr cint): OGRErr {.stdcall,
    importc: "OGR_L_ReorderFields", dynlib: dynlibogr_api.}
proc reorderField*(a1: OGRLayerH; iOldFieldPos: cint; iNewFieldPos: cint): OGRErr {.
    stdcall, importc: "OGR_L_ReorderField", dynlib: dynlibogr_api.}
proc alterFieldDefn*(a1: OGRLayerH; iField: cint; hNewFieldDefn: OGRFieldDefnH;
                          nFlags: cint): OGRErr {.stdcall,
    importc: "OGR_L_AlterFieldDefn", dynlib: dynlibogr_api.}
proc startTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_StartTransaction", dynlib: dynlibogr_api.}
proc commitTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_CommitTransaction", dynlib: dynlibogr_api.}
proc rollbackTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_RollbackTransaction", dynlib: dynlibogr_api.}
proc reference*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_Reference",
    dynlib: dynlibogr_api.}
proc dereference*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_Dereference",
    dynlib: dynlibogr_api.}
proc getRefCount*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_GetRefCount",
    dynlib: dynlibogr_api.}
proc syncToDisk*(a1: OGRLayerH): OGRErr {.stdcall, importc: "OGR_L_SyncToDisk",
    dynlib: dynlibogr_api.}
proc getFeaturesRead*(a1: OGRLayerH): GIntBig {.stdcall,
    importc: "OGR_L_GetFeaturesRead", dynlib: dynlibogr_api.}
proc getFIDColumn*(a1: OGRLayerH): cstring {.stdcall,
    importc: "OGR_L_GetFIDColumn", dynlib: dynlibogr_api.}
proc getGeometryColumn*(a1: OGRLayerH): cstring {.stdcall,
    importc: "OGR_L_GetGeometryColumn", dynlib: dynlibogr_api.}
proc getStyleTable*(a1: OGRLayerH): OGRStyleTableH {.stdcall,
    importc: "OGR_L_GetStyleTable", dynlib: dynlibogr_api.}
proc setStyleTableDirectly*(a1: OGRLayerH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_L_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc setStyleTable*(a1: OGRLayerH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_L_SetStyleTable", dynlib: dynlibogr_api.}
proc setIgnoredFields*(a1: OGRLayerH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_L_SetIgnoredFields", dynlib: dynlibogr_api.}
proc intersection*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                        a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Intersection", dynlib: dynlibogr_api.}
proc union*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                 a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Union", dynlib: dynlibogr_api.}
proc symDifference*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH;
                         a4: cstringArray; a5: GDALProgressFunc; a6: pointer): OGRErr {.
    stdcall, importc: "OGR_L_SymDifference", dynlib: dynlibogr_api.}
proc identity*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                    a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Identity", dynlib: dynlibogr_api.}
proc update*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                  a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Update", dynlib: dynlibogr_api.}
proc clip*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Clip", dynlib: dynlibogr_api.}
proc erase*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                 a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Erase", dynlib: dynlibogr_api.}
proc destroy*(a1: OGRDataSourceH) {.stdcall, importc: "OGR_DS_Destroy",
                                        dynlib: dynlibogr_api.}
proc getName*(a1: OGRDataSourceH): cstring {.stdcall,
    importc: "OGR_DS_GetName", dynlib: dynlibogr_api.}
proc getLayerCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetLayerCount", dynlib: dynlibogr_api.}
proc getLayer*(a1: OGRDataSourceH; a2: cint): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayer", dynlib: dynlibogr_api.}
proc getLayerByName*(a1: OGRDataSourceH; a2: cstring): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayerByName", dynlib: dynlibogr_api.}
proc deleteLayer*(a1: OGRDataSourceH; a2: cint): OGRErr {.stdcall,
    importc: "OGR_DS_DeleteLayer", dynlib: dynlibogr_api.}
proc getDriver*(a1: OGRDataSourceH): OGRSFDriverH {.stdcall,
    importc: "OGR_DS_GetDriver", dynlib: dynlibogr_api.}
proc createLayer*(a1: OGRDataSourceH; a2: cstring; a3: OGRSpatialReferenceH;
                        a4: OGRwkbGeometryType; a5: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CreateLayer", dynlib: dynlibogr_api.}
proc copyLayer*(a1: OGRDataSourceH; a2: OGRLayerH; a3: cstring; a4: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CopyLayer", dynlib: dynlibogr_api.}
proc testCapability*(a1: OGRDataSourceH; a2: cstring): cint {.stdcall,
    importc: "OGR_DS_TestCapability", dynlib: dynlibogr_api.}
proc executeSQL*(a1: OGRDataSourceH; a2: cstring; a3: OGRGeometryH; a4: cstring): OGRLayerH {.
    stdcall, importc: "OGR_DS_ExecuteSQL", dynlib: dynlibogr_api.}
proc releaseResultSet*(a1: OGRDataSourceH; a2: OGRLayerH) {.stdcall,
    importc: "OGR_DS_ReleaseResultSet", dynlib: dynlibogr_api.}
proc reference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Reference", dynlib: dynlibogr_api.}
proc dereference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Dereference", dynlib: dynlibogr_api.}
proc getRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetRefCount", dynlib: dynlibogr_api.}
proc getSummaryRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetSummaryRefCount", dynlib: dynlibogr_api.}
proc syncToDisk*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGR_DS_SyncToDisk", dynlib: dynlibogr_api.}
proc getStyleTable*(a1: OGRDataSourceH): OGRStyleTableH {.stdcall,
    importc: "OGR_DS_GetStyleTable", dynlib: dynlibogr_api.}
proc setStyleTableDirectly*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc setStyleTable*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTable", dynlib: dynlibogr_api.}
proc getName*(a1: OGRSFDriverH): cstring {.stdcall, importc: "OGR_Dr_GetName",
    dynlib: dynlibogr_api.}
proc open*(a1: OGRSFDriverH; a2: cstring; a3: cint): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_Open", dynlib: dynlibogr_api.}
proc testCapability*(a1: OGRSFDriverH; a2: cstring): cint {.stdcall,
    importc: "OGR_Dr_TestCapability", dynlib: dynlibogr_api.}
proc createDataSource*(a1: OGRSFDriverH; a2: cstring; a3: cstringArray): OGRDataSourceH {.
    stdcall, importc: "OGR_Dr_CreateDataSource", dynlib: dynlibogr_api.}
proc copyDataSource*(a1: OGRSFDriverH; a2: OGRDataSourceH; a3: cstring;
                           a4: cstringArray): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_CopyDataSource", dynlib: dynlibogr_api.}
proc deleteDataSource*(a1: OGRSFDriverH; a2: cstring): OGRErr {.stdcall,
    importc: "OGR_Dr_DeleteDataSource", dynlib: dynlibogr_api.}
proc open*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.stdcall,
    importc: "OGROpen", dynlib: dynlibogr_api.}
proc openShared*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.
    stdcall, importc: "OGROpenShared", dynlib: dynlibogr_api.}
proc releaseDataSource*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGRReleaseDataSource", dynlib: dynlibogr_api.}
proc registerDriver*(a1: OGRSFDriverH) {.stdcall, importc: "OGRRegisterDriver",
    dynlib: dynlibogr_api.}
proc deregisterDriver*(a1: OGRSFDriverH) {.stdcall,
    importc: "OGRDeregisterDriver", dynlib: dynlibogr_api.}
proc getDriverCount*(): cint {.stdcall, importc: "OGRGetDriverCount",
                               dynlib: dynlibogr_api.}
proc getDriver*(a1: cint): OGRSFDriverH {.stdcall, importc: "OGRGetDriver",
    dynlib: dynlibogr_api.}
proc getDriverByName*(a1: cstring): OGRSFDriverH {.stdcall,
    importc: "OGRGetDriverByName", dynlib: dynlibogr_api.}
proc getOpenDSCount*(): cint {.stdcall, importc: "OGRGetOpenDSCount",
                               dynlib: dynlibogr_api.}
proc getOpenDS*(iDS: cint): OGRDataSourceH {.stdcall, importc: "OGRGetOpenDS",
    dynlib: dynlibogr_api.}
proc registerAll*() {.stdcall, importc: "OGRRegisterAll", dynlib: dynlibogr_api.}
proc cleanupAll*() {.stdcall, importc: "OGRCleanupAll", dynlib: dynlibogr_api.}
type
  OGRStyleMgr = object
  OGRStyleMgrH* = ptr OGRStyleMgr
  OGRStyleTool = object
  OGRStyleToolH* = ptr OGRStyleTool

proc create*(hStyleTable: OGRStyleTableH): OGRStyleMgrH {.stdcall,
    importc: "OGR_SM_Create", dynlib: dynlibogr_api.}
proc destroy*(hSM: OGRStyleMgrH) {.stdcall, importc: "OGR_SM_Destroy",
                                       dynlib: dynlibogr_api.}
proc initFromFeature*(hSM: OGRStyleMgrH; hFeat: OGRFeatureH): cstring {.
    stdcall, importc: "OGR_SM_InitFromFeature", dynlib: dynlibogr_api.}
proc initStyleString*(hSM: OGRStyleMgrH; pszStyleString: cstring): cint {.
    stdcall, importc: "OGR_SM_InitStyleString", dynlib: dynlibogr_api.}
proc getPartCount*(hSM: OGRStyleMgrH; pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_SM_GetPartCount", dynlib: dynlibogr_api.}
proc getPart*(hSM: OGRStyleMgrH; nPartId: cint; pszStyleString: cstring): OGRStyleToolH {.
    stdcall, importc: "OGR_SM_GetPart", dynlib: dynlibogr_api.}
proc addPart*(hSM: OGRStyleMgrH; hST: OGRStyleToolH): cint {.stdcall,
    importc: "OGR_SM_AddPart", dynlib: dynlibogr_api.}
proc addStyle*(hSM: OGRStyleMgrH; pszStyleName: cstring;
                     pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_SM_AddStyle", dynlib: dynlibogr_api.}
proc create*(eClassId: OGRSTClassId): OGRStyleToolH {.stdcall,
    importc: "OGR_ST_Create", dynlib: dynlibogr_api.}
proc destroy*(hST: OGRStyleToolH) {.stdcall, importc: "OGR_ST_Destroy",
                                        dynlib: dynlibogr_api.}
proc getType*(hST: OGRStyleToolH): OGRSTClassId {.stdcall,
    importc: "OGR_ST_GetType", dynlib: dynlibogr_api.}
proc getUnit*(hST: OGRStyleToolH): OGRSTUnitId {.stdcall,
    importc: "OGR_ST_GetUnit", dynlib: dynlibogr_api.}
proc setUnit*(hST: OGRStyleToolH; eUnit: OGRSTUnitId;
                    dfGroundPaperScale: cdouble) {.stdcall,
    importc: "OGR_ST_SetUnit", dynlib: dynlibogr_api.}
proc getParamStr*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cstring {.
    stdcall, importc: "OGR_ST_GetParamStr", dynlib: dynlibogr_api.}
proc getParamNum*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cint {.
    stdcall, importc: "OGR_ST_GetParamNum", dynlib: dynlibogr_api.}
proc getParamDbl*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cdouble {.
    stdcall, importc: "OGR_ST_GetParamDbl", dynlib: dynlibogr_api.}
proc setParamStr*(hST: OGRStyleToolH; eParam: cint; pszValue: cstring) {.
    stdcall, importc: "OGR_ST_SetParamStr", dynlib: dynlibogr_api.}
proc setParamNum*(hST: OGRStyleToolH; eParam: cint; nValue: cint) {.stdcall,
    importc: "OGR_ST_SetParamNum", dynlib: dynlibogr_api.}
proc setParamDbl*(hST: OGRStyleToolH; eParam: cint; dfValue: cdouble) {.stdcall,
    importc: "OGR_ST_SetParamDbl", dynlib: dynlibogr_api.}
proc getStyleString*(hST: OGRStyleToolH): cstring {.stdcall,
    importc: "OGR_ST_GetStyleString", dynlib: dynlibogr_api.}
proc getRGBFromString*(hST: OGRStyleToolH; pszColor: cstring; pnRed: ptr cint;
                             pnGreen: ptr cint; pnBlue: ptr cint; pnAlpha: ptr cint): cint {.
    stdcall, importc: "OGR_ST_GetRGBFromString", dynlib: dynlibogr_api.}
proc create*(): OGRStyleTableH {.stdcall, importc: "OGR_STBL_Create",
                                       dynlib: dynlibogr_api.}
proc destroy*(hSTBL: OGRStyleTableH) {.stdcall,
    importc: "OGR_STBL_Destroy", dynlib: dynlibogr_api.}
proc addStyle*(hStyleTable: OGRStyleTableH; pszName: cstring;
                       pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_STBL_AddStyle", dynlib: dynlibogr_api.}
proc saveStyleTable*(hStyleTable: OGRStyleTableH; pszFilename: cstring): cint {.
    stdcall, importc: "OGR_STBL_SaveStyleTable", dynlib: dynlibogr_api.}
proc loadStyleTable*(hStyleTable: OGRStyleTableH; pszFilename: cstring): cint {.
    stdcall, importc: "OGR_STBL_LoadStyleTable", dynlib: dynlibogr_api.}
proc find*(hStyleTable: OGRStyleTableH; pszName: cstring): cstring {.stdcall,
    importc: "OGR_STBL_Find", dynlib: dynlibogr_api.}
proc resetStyleStringReading*(hStyleTable: OGRStyleTableH) {.stdcall,
    importc: "OGR_STBL_ResetStyleStringReading", dynlib: dynlibogr_api.}
proc getNextStyle*(hStyleTable: OGRStyleTableH): cstring {.stdcall,
    importc: "OGR_STBL_GetNextStyle", dynlib: dynlibogr_api.}
proc getLastStyleName*(hStyleTable: OGRStyleTableH): cstring {.stdcall,
    importc: "OGR_STBL_GetLastStyleName", dynlib: dynlibogr_api.}