import cpl_progress
import cpl_minixml
import cpl_port
import ogr_core
export ogr_core
#import wrap/cpl_progress
#import wrap/cpl_minixml
#import wrap/ogr_core
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


proc OGR_G_CreateFromWkb*(a1: ptr cuchar; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH; a4: cint): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromWkb", dynlib: dynlibogr_api.}
proc OGR_G_CreateFromWkt*(a1: cstringArray; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromWkt", dynlib: dynlibogr_api.}
proc OGR_G_CreateFromFgf*(a1: ptr cuchar; a2: OGRSpatialReferenceH;
                         a3: ptr OGRGeometryH; a4: cint; a5: ptr cint): OGRErr {.stdcall,
    importc: "OGR_G_CreateFromFgf", dynlib: dynlibogr_api.}
proc OGR_G_DestroyGeometry*(a1: OGRGeometryH) {.stdcall,
    importc: "OGR_G_DestroyGeometry", dynlib: dynlibogr_api.}
proc OGR_G_CreateGeometry*(a1: OGRwkbGeometryType): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateGeometry", dynlib: dynlibogr_api.}
proc OGR_G_ApproximateArcAngles*(dfCenterX: cdouble; dfCenterY: cdouble;
                                dfZ: cdouble; dfPrimaryRadius: cdouble;
                                dfSecondaryAxis: cdouble; dfRotation: cdouble;
                                dfStartAngle: cdouble; dfEndAngle: cdouble;
                                dfMaxAngleStepSizeDegrees: cdouble): OGRGeometryH {.
    stdcall, importc: "OGR_G_ApproximateArcAngles", dynlib: dynlibogr_api.}
proc OGR_G_ForceToPolygon*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToPolygon", dynlib: dynlibogr_api.}
proc OGR_G_ForceToLineString*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToLineString", dynlib: dynlibogr_api.}
proc OGR_G_ForceToMultiPolygon*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiPolygon", dynlib: dynlibogr_api.}
proc OGR_G_ForceToMultiPoint*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiPoint", dynlib: dynlibogr_api.}
proc OGR_G_ForceToMultiLineString*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceToMultiLineString", dynlib: dynlibogr_api.}
proc OGR_G_ForceTo*(hGeom: OGRGeometryH; eTargetType: OGRwkbGeometryType;
                   papszOptions: cstringArray): OGRGeometryH {.stdcall,
    importc: "OGR_G_ForceTo", dynlib: dynlibogr_api.}
proc OGR_G_GetDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetDimension", dynlib: dynlibogr_api.}
proc OGR_G_GetCoordinateDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetCoordinateDimension", dynlib: dynlibogr_api.}
proc OGR_G_CoordinateDimension*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_CoordinateDimension", dynlib: dynlibogr_api.}
proc OGR_G_SetCoordinateDimension*(a1: OGRGeometryH; a2: cint) {.stdcall,
    importc: "OGR_G_SetCoordinateDimension", dynlib: dynlibogr_api.}
proc OGR_G_Is3D*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_Is3D",
                                       dynlib: dynlibogr_api.}
proc OGR_G_IsMeasured*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_IsMeasured", dynlib: dynlibogr_api.}
proc OGR_G_Set3D*(a1: OGRGeometryH; a2: cint) {.stdcall, importc: "OGR_G_Set3D",
    dynlib: dynlibogr_api.}
proc OGR_G_SetMeasured*(a1: OGRGeometryH; a2: cint) {.stdcall,
    importc: "OGR_G_SetMeasured", dynlib: dynlibogr_api.}
proc OGR_G_Clone*(a1: OGRGeometryH): OGRGeometryH {.stdcall, importc: "OGR_G_Clone",
    dynlib: dynlibogr_api.}
proc OGR_G_GetEnvelope*(a1: OGRGeometryH; a2: ptr OGREnvelope) {.stdcall,
    importc: "OGR_G_GetEnvelope", dynlib: dynlibogr_api.}
proc OGR_G_GetEnvelope3D*(a1: OGRGeometryH; a2: ptr OGREnvelope3D) {.stdcall,
    importc: "OGR_G_GetEnvelope3D", dynlib: dynlibogr_api.}
proc OGR_G_ImportFromWkb*(a1: OGRGeometryH; a2: ptr cuchar; a3: cint): OGRErr {.stdcall,
    importc: "OGR_G_ImportFromWkb", dynlib: dynlibogr_api.}
proc OGR_G_ExportToWkb*(a1: OGRGeometryH; a2: OGRwkbByteOrder; a3: ptr cuchar): OGRErr {.
    stdcall, importc: "OGR_G_ExportToWkb", dynlib: dynlibogr_api.}
proc OGR_G_ExportToIsoWkb*(a1: OGRGeometryH; a2: OGRwkbByteOrder; a3: ptr cuchar): OGRErr {.
    stdcall, importc: "OGR_G_ExportToIsoWkb", dynlib: dynlibogr_api.}
proc OGR_G_WkbSize*(hGeom: OGRGeometryH): cint {.stdcall, importc: "OGR_G_WkbSize",
    dynlib: dynlibogr_api.}
proc OGR_G_ImportFromWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ImportFromWkt", dynlib: dynlibogr_api.}
proc OGR_G_ExportToWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ExportToWkt", dynlib: dynlibogr_api.}
proc OGR_G_ExportToIsoWkt*(a1: OGRGeometryH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_G_ExportToIsoWkt", dynlib: dynlibogr_api.}
proc OGR_G_GetGeometryType*(a1: OGRGeometryH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_G_GetGeometryType", dynlib: dynlibogr_api.}
proc OGR_G_GetGeometryName*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_GetGeometryName", dynlib: dynlibogr_api.}
proc OGR_G_DumpReadable*(a1: OGRGeometryH; a2: ptr FILE; a3: cstring) {.stdcall,
    importc: "OGR_G_DumpReadable", dynlib: dynlibogr_api.}
proc OGR_G_FlattenTo2D*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_FlattenTo2D",
    dynlib: dynlibogr_api.}
proc OGR_G_CloseRings*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_CloseRings",
                                        dynlib: dynlibogr_api.}
proc OGR_G_CreateFromGML*(a1: cstring): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateFromGML", dynlib: dynlibogr_api.}
proc OGR_G_ExportToGML*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_ExportToGML", dynlib: dynlibogr_api.}
proc OGR_G_ExportToGMLEx*(a1: OGRGeometryH; papszOptions: cstringArray): cstring {.
    stdcall, importc: "OGR_G_ExportToGMLEx", dynlib: dynlibogr_api.}
proc OGR_G_CreateFromGMLTree*(a1: ptr CPLXMLNode): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateFromGMLTree", dynlib: dynlibogr_api.}
proc OGR_G_ExportToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.stdcall,
    importc: "OGR_G_ExportToGMLTree", dynlib: dynlibogr_api.}
proc OGR_G_ExportEnvelopeToGMLTree*(a1: OGRGeometryH): ptr CPLXMLNode {.stdcall,
    importc: "OGR_G_ExportEnvelopeToGMLTree", dynlib: dynlibogr_api.}
proc OGR_G_ExportToKML*(a1: OGRGeometryH; pszAltitudeMode: cstring): cstring {.
    stdcall, importc: "OGR_G_ExportToKML", dynlib: dynlibogr_api.}
proc OGR_G_ExportToJson*(a1: OGRGeometryH): cstring {.stdcall,
    importc: "OGR_G_ExportToJson", dynlib: dynlibogr_api.}
proc OGR_G_ExportToJsonEx*(a1: OGRGeometryH; papszOptions: cstringArray): cstring {.
    stdcall, importc: "OGR_G_ExportToJsonEx", dynlib: dynlibogr_api.}
proc OGR_G_CreateGeometryFromJson*(a1: cstring): OGRGeometryH {.stdcall,
    importc: "OGR_G_CreateGeometryFromJson", dynlib: dynlibogr_api.}
proc OGR_G_AssignSpatialReference*(a1: OGRGeometryH; a2: OGRSpatialReferenceH) {.
    stdcall, importc: "OGR_G_AssignSpatialReference", dynlib: dynlibogr_api.}
proc OGR_G_GetSpatialReference*(a1: OGRGeometryH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_G_GetSpatialReference", dynlib: dynlibogr_api.}
proc OGR_G_Transform*(a1: OGRGeometryH; a2: OGRCoordinateTransformationH): OGRErr {.
    stdcall, importc: "OGR_G_Transform", dynlib: dynlibogr_api.}
proc OGR_G_TransformTo*(a1: OGRGeometryH; a2: OGRSpatialReferenceH): OGRErr {.stdcall,
    importc: "OGR_G_TransformTo", dynlib: dynlibogr_api.}
proc OGR_G_Simplify*(hThis: OGRGeometryH; tolerance: cdouble): OGRGeometryH {.stdcall,
    importc: "OGR_G_Simplify", dynlib: dynlibogr_api.}
proc OGR_G_SimplifyPreserveTopology*(hThis: OGRGeometryH; tolerance: cdouble): OGRGeometryH {.
    stdcall, importc: "OGR_G_SimplifyPreserveTopology", dynlib: dynlibogr_api.}
proc OGR_G_DelaunayTriangulation*(hThis: OGRGeometryH; dfTolerance: cdouble;
                                 bOnlyEdges: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_DelaunayTriangulation", dynlib: dynlibogr_api.}
proc OGR_G_Segmentize*(hGeom: OGRGeometryH; dfMaxLength: cdouble) {.stdcall,
    importc: "OGR_G_Segmentize", dynlib: dynlibogr_api.}
proc OGR_G_Intersects*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Intersects", dynlib: dynlibogr_api.}
proc OGR_G_Equals*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Equals", dynlib: dynlibogr_api.}
proc OGR_G_Disjoint*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Disjoint", dynlib: dynlibogr_api.}
proc OGR_G_Touches*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Touches", dynlib: dynlibogr_api.}
proc OGR_G_Crosses*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Crosses", dynlib: dynlibogr_api.}
proc OGR_G_Within*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Within", dynlib: dynlibogr_api.}
proc OGR_G_Contains*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Contains", dynlib: dynlibogr_api.}
proc OGR_G_Overlaps*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Overlaps", dynlib: dynlibogr_api.}
proc OGR_G_Boundary*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Boundary", dynlib: dynlibogr_api.}
proc OGR_G_ConvexHull*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_ConvexHull", dynlib: dynlibogr_api.}
proc OGR_G_Buffer*(a1: OGRGeometryH; a2: cdouble; a3: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_Buffer", dynlib: dynlibogr_api.}
proc OGR_G_Intersection*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Intersection", dynlib: dynlibogr_api.}
proc OGR_G_Union*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Union", dynlib: dynlibogr_api.}
proc OGR_G_UnionCascaded*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_UnionCascaded", dynlib: dynlibogr_api.}
proc OGR_G_PointOnSurface*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_PointOnSurface", dynlib: dynlibogr_api.}
proc OGR_G_Difference*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Difference", dynlib: dynlibogr_api.}
proc OGR_G_SymDifference*(a1: OGRGeometryH; a2: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_SymDifference", dynlib: dynlibogr_api.}
proc OGR_G_Distance*(a1: OGRGeometryH; a2: OGRGeometryH): cdouble {.stdcall,
    importc: "OGR_G_Distance", dynlib: dynlibogr_api.}
proc OGR_G_Distance3D*(a1: OGRGeometryH; a2: OGRGeometryH): cdouble {.stdcall,
    importc: "OGR_G_Distance3D", dynlib: dynlibogr_api.}
proc OGR_G_Length*(a1: OGRGeometryH): cdouble {.stdcall, importc: "OGR_G_Length",
    dynlib: dynlibogr_api.}
proc OGR_G_Area*(a1: OGRGeometryH): cdouble {.stdcall, importc: "OGR_G_Area",
    dynlib: dynlibogr_api.}
proc OGR_G_Centroid*(a1: OGRGeometryH; a2: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_Centroid", dynlib: dynlibogr_api.}
proc OGR_G_Value*(a1: OGRGeometryH; dfDistance: cdouble): OGRGeometryH {.stdcall,
    importc: "OGR_G_Value", dynlib: dynlibogr_api.}
proc OGR_G_Empty*(a1: OGRGeometryH) {.stdcall, importc: "OGR_G_Empty",
                                   dynlib: dynlibogr_api.}
proc OGR_G_IsEmpty*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsEmpty",
    dynlib: dynlibogr_api.}
proc OGR_G_IsValid*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsValid",
    dynlib: dynlibogr_api.}
proc OGR_G_IsSimple*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsSimple",
    dynlib: dynlibogr_api.}
proc OGR_G_IsRing*(a1: OGRGeometryH): cint {.stdcall, importc: "OGR_G_IsRing",
    dynlib: dynlibogr_api.}
proc OGR_G_Polygonize*(a1: OGRGeometryH): OGRGeometryH {.stdcall,
    importc: "OGR_G_Polygonize", dynlib: dynlibogr_api.}
proc OGR_G_GetPointCount*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetPointCount", dynlib: dynlibogr_api.}
proc OGR_G_GetPoints*(hGeom: OGRGeometryH; pabyX: pointer; nXStride: cint;
                     pabyY: pointer; nYStride: cint; pabyZ: pointer; nZStride: cint): cint {.
    stdcall, importc: "OGR_G_GetPoints", dynlib: dynlibogr_api.}
proc OGR_G_GetPointsZM*(hGeom: OGRGeometryH; pabyX: pointer; nXStride: cint;
                       pabyY: pointer; nYStride: cint; pabyZ: pointer; nZStride: cint;
                       pabyM: pointer; nMStride: cint): cint {.stdcall,
    importc: "OGR_G_GetPointsZM", dynlib: dynlibogr_api.}
proc OGR_G_GetX*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetX",
    dynlib: dynlibogr_api.}
proc OGR_G_GetY*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetY",
    dynlib: dynlibogr_api.}
proc OGR_G_GetZ*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetZ",
    dynlib: dynlibogr_api.}
proc OGR_G_GetM*(a1: OGRGeometryH; a2: cint): cdouble {.stdcall, importc: "OGR_G_GetM",
    dynlib: dynlibogr_api.}
proc OGR_G_GetPoint*(a1: OGRGeometryH; iPoint: cint; a3: ptr cdouble; a4: ptr cdouble;
                    a5: ptr cdouble) {.stdcall, importc: "OGR_G_GetPoint",
                                    dynlib: dynlibogr_api.}
proc OGR_G_GetPointZM*(a1: OGRGeometryH; iPoint: cint; a3: ptr cdouble; a4: ptr cdouble;
                      a5: ptr cdouble; a6: ptr cdouble) {.stdcall,
    importc: "OGR_G_GetPointZM", dynlib: dynlibogr_api.}
proc OGR_G_SetPointCount*(hGeom: OGRGeometryH; nNewPointCount: cint) {.stdcall,
    importc: "OGR_G_SetPointCount", dynlib: dynlibogr_api.}
proc OGR_G_SetPoint*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                    a5: cdouble) {.stdcall, importc: "OGR_G_SetPoint",
                                 dynlib: dynlibogr_api.}
proc OGR_G_SetPoint_2D*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble) {.
    stdcall, importc: "OGR_G_SetPoint_2D", dynlib: dynlibogr_api.}
proc OGR_G_SetPointM*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                     a5: cdouble) {.stdcall, importc: "OGR_G_SetPointM",
                                  dynlib: dynlibogr_api.}
proc OGR_G_SetPointZM*(a1: OGRGeometryH; iPoint: cint; a3: cdouble; a4: cdouble;
                      a5: cdouble; a6: cdouble) {.stdcall,
    importc: "OGR_G_SetPointZM", dynlib: dynlibogr_api.}
proc OGR_G_AddPoint*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble) {.stdcall,
    importc: "OGR_G_AddPoint", dynlib: dynlibogr_api.}
proc OGR_G_AddPoint_2D*(a1: OGRGeometryH; a2: cdouble; a3: cdouble) {.stdcall,
    importc: "OGR_G_AddPoint_2D", dynlib: dynlibogr_api.}
proc OGR_G_AddPointM*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble) {.stdcall,
    importc: "OGR_G_AddPointM", dynlib: dynlibogr_api.}
proc OGR_G_AddPointZM*(a1: OGRGeometryH; a2: cdouble; a3: cdouble; a4: cdouble;
                      a5: cdouble) {.stdcall, importc: "OGR_G_AddPointZM",
                                   dynlib: dynlibogr_api.}
proc OGR_G_SetPoints*(hGeom: OGRGeometryH; nPointsIn: cint; pabyX: pointer;
                     nXStride: cint; pabyY: pointer; nYStride: cint; pabyZ: pointer;
                     nZStride: cint) {.stdcall, importc: "OGR_G_SetPoints",
                                     dynlib: dynlibogr_api.}
proc OGR_G_SetPointsZM*(hGeom: OGRGeometryH; nPointsIn: cint; pabyX: pointer;
                       nXStride: cint; pabyY: pointer; nYStride: cint; pabyZ: pointer;
                       nZStride: cint; pabyM: pointer; nMStride: cint) {.stdcall,
    importc: "OGR_G_SetPointsZM", dynlib: dynlibogr_api.}
proc OGR_G_GetGeometryCount*(a1: OGRGeometryH): cint {.stdcall,
    importc: "OGR_G_GetGeometryCount", dynlib: dynlibogr_api.}
proc OGR_G_GetGeometryRef*(a1: OGRGeometryH; a2: cint): OGRGeometryH {.stdcall,
    importc: "OGR_G_GetGeometryRef", dynlib: dynlibogr_api.}
proc OGR_G_AddGeometry*(a1: OGRGeometryH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_AddGeometry", dynlib: dynlibogr_api.}
proc OGR_G_AddGeometryDirectly*(a1: OGRGeometryH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_G_AddGeometryDirectly", dynlib: dynlibogr_api.}
proc OGR_G_RemoveGeometry*(a1: OGRGeometryH; a2: cint; a3: cint): OGRErr {.stdcall,
    importc: "OGR_G_RemoveGeometry", dynlib: dynlibogr_api.}
proc OGR_G_HasCurveGeometry*(a1: OGRGeometryH; bLookForNonLinear: cint): cint {.
    stdcall, importc: "OGR_G_HasCurveGeometry", dynlib: dynlibogr_api.}
proc OGR_G_GetLinearGeometry*(hGeom: OGRGeometryH;
                             dfMaxAngleStepSizeDegrees: cdouble;
                             papszOptions: cstringArray): OGRGeometryH {.stdcall,
    importc: "OGR_G_GetLinearGeometry", dynlib: dynlibogr_api.}
proc OGR_G_GetCurveGeometry*(hGeom: OGRGeometryH; papszOptions: cstringArray): OGRGeometryH {.
    stdcall, importc: "OGR_G_GetCurveGeometry", dynlib: dynlibogr_api.}
proc OGRBuildPolygonFromEdges*(hLinesAsCollection: OGRGeometryH; bBestEffort: cint;
                              bAutoClose: cint; dfTolerance: cdouble;
                              peErr: ptr OGRErr): OGRGeometryH {.stdcall,
    importc: "OGRBuildPolygonFromEdges", dynlib: dynlibogr_api.}
proc OGRSetGenerate_DB2_V72_BYTE_ORDER*(bGenerate_DB2_V72_BYTE_ORDER: cint): OGRErr {.
    stdcall, importc: "OGRSetGenerate_DB2_V72_BYTE_ORDER", dynlib: dynlibogr_api.}
proc OGRGetGenerate_DB2_V72_BYTE_ORDER*(): cint {.stdcall,
    importc: "OGRGetGenerate_DB2_V72_BYTE_ORDER", dynlib: dynlibogr_api.}
proc OGRSetNonLinearGeometriesEnabledFlag*(bFlag: cint) {.stdcall,
    importc: "OGRSetNonLinearGeometriesEnabledFlag", dynlib: dynlibogr_api.}
proc OGRGetNonLinearGeometriesEnabledFlag*(): cint {.stdcall,
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

proc OGR_Fld_Create*(a1: cstring; a2: OGRFieldType): OGRFieldDefnH {.stdcall,
    importc: "OGR_Fld_Create", dynlib: dynlibogr_api.}
proc OGR_Fld_Destroy*(a1: OGRFieldDefnH) {.stdcall, importc: "OGR_Fld_Destroy",
                                        dynlib: dynlibogr_api.}
proc OGR_Fld_SetName*(a1: OGRFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_Fld_SetName", dynlib: dynlibogr_api.}
proc OGR_Fld_GetNameRef*(a1: OGRFieldDefnH): cstring {.stdcall,
    importc: "OGR_Fld_GetNameRef", dynlib: dynlibogr_api.}
proc OGR_Fld_GetType*(a1: OGRFieldDefnH): OGRFieldType {.stdcall,
    importc: "OGR_Fld_GetType", dynlib: dynlibogr_api.}
proc OGR_Fld_SetType*(a1: OGRFieldDefnH; a2: OGRFieldType) {.stdcall,
    importc: "OGR_Fld_SetType", dynlib: dynlibogr_api.}
proc OGR_Fld_GetSubType*(a1: OGRFieldDefnH): OGRFieldSubType {.stdcall,
    importc: "OGR_Fld_GetSubType", dynlib: dynlibogr_api.}
proc OGR_Fld_SetSubType*(a1: OGRFieldDefnH; a2: OGRFieldSubType) {.stdcall,
    importc: "OGR_Fld_SetSubType", dynlib: dynlibogr_api.}
proc OGR_Fld_GetJustify*(a1: OGRFieldDefnH): OGRJustification {.stdcall,
    importc: "OGR_Fld_GetJustify", dynlib: dynlibogr_api.}
proc OGR_Fld_SetJustify*(a1: OGRFieldDefnH; a2: OGRJustification) {.stdcall,
    importc: "OGR_Fld_SetJustify", dynlib: dynlibogr_api.}
proc OGR_Fld_GetWidth*(a1: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_GetWidth", dynlib: dynlibogr_api.}
proc OGR_Fld_SetWidth*(a1: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetWidth", dynlib: dynlibogr_api.}
proc OGR_Fld_GetPrecision*(a1: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_GetPrecision", dynlib: dynlibogr_api.}
proc OGR_Fld_SetPrecision*(a1: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetPrecision", dynlib: dynlibogr_api.}
proc OGR_Fld_Set*(a1: OGRFieldDefnH; a2: cstring; a3: OGRFieldType; a4: cint; a5: cint;
                 a6: OGRJustification) {.stdcall, importc: "OGR_Fld_Set",
                                       dynlib: dynlibogr_api.}
proc OGR_Fld_IsIgnored*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsIgnored", dynlib: dynlibogr_api.}
proc OGR_Fld_SetIgnored*(hDefn: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetIgnored", dynlib: dynlibogr_api.}
proc OGR_Fld_IsNullable*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsNullable", dynlib: dynlibogr_api.}
proc OGR_Fld_SetNullable*(hDefn: OGRFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_Fld_SetNullable", dynlib: dynlibogr_api.}
proc OGR_Fld_GetDefault*(hDefn: OGRFieldDefnH): cstring {.stdcall,
    importc: "OGR_Fld_GetDefault", dynlib: dynlibogr_api.}
proc OGR_Fld_SetDefault*(hDefn: OGRFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_Fld_SetDefault", dynlib: dynlibogr_api.}
proc OGR_Fld_IsDefaultDriverSpecific*(hDefn: OGRFieldDefnH): cint {.stdcall,
    importc: "OGR_Fld_IsDefaultDriverSpecific", dynlib: dynlibogr_api.}
proc OGR_GetFieldTypeName*(a1: OGRFieldType): cstring {.stdcall,
    importc: "OGR_GetFieldTypeName", dynlib: dynlibogr_api.}
proc OGR_GetFieldSubTypeName*(a1: OGRFieldSubType): cstring {.stdcall,
    importc: "OGR_GetFieldSubTypeName", dynlib: dynlibogr_api.}
proc OGR_AreTypeSubTypeCompatible*(eType: OGRFieldType; eSubType: OGRFieldSubType): cint {.
    stdcall, importc: "OGR_AreTypeSubTypeCompatible", dynlib: dynlibogr_api.}
proc OGR_GFld_Create*(a1: cstring; a2: OGRwkbGeometryType): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_GFld_Create", dynlib: dynlibogr_api.}
proc OGR_GFld_Destroy*(a1: OGRGeomFieldDefnH) {.stdcall,
    importc: "OGR_GFld_Destroy", dynlib: dynlibogr_api.}
proc OGR_GFld_SetName*(a1: OGRGeomFieldDefnH; a2: cstring) {.stdcall,
    importc: "OGR_GFld_SetName", dynlib: dynlibogr_api.}
proc OGR_GFld_GetNameRef*(a1: OGRGeomFieldDefnH): cstring {.stdcall,
    importc: "OGR_GFld_GetNameRef", dynlib: dynlibogr_api.}
proc OGR_GFld_GetType*(a1: OGRGeomFieldDefnH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GFld_GetType", dynlib: dynlibogr_api.}
proc OGR_GFld_SetType*(a1: OGRGeomFieldDefnH; a2: OGRwkbGeometryType) {.stdcall,
    importc: "OGR_GFld_SetType", dynlib: dynlibogr_api.}
proc OGR_GFld_GetSpatialRef*(a1: OGRGeomFieldDefnH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_GFld_GetSpatialRef", dynlib: dynlibogr_api.}
proc OGR_GFld_SetSpatialRef*(a1: OGRGeomFieldDefnH; hSRS: OGRSpatialReferenceH) {.
    stdcall, importc: "OGR_GFld_SetSpatialRef", dynlib: dynlibogr_api.}
proc OGR_GFld_IsNullable*(hDefn: OGRGeomFieldDefnH): cint {.stdcall,
    importc: "OGR_GFld_IsNullable", dynlib: dynlibogr_api.}
proc OGR_GFld_SetNullable*(hDefn: OGRGeomFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_GFld_SetNullable", dynlib: dynlibogr_api.}
proc OGR_GFld_IsIgnored*(hDefn: OGRGeomFieldDefnH): cint {.stdcall,
    importc: "OGR_GFld_IsIgnored", dynlib: dynlibogr_api.}
proc OGR_GFld_SetIgnored*(hDefn: OGRGeomFieldDefnH; a2: cint) {.stdcall,
    importc: "OGR_GFld_SetIgnored", dynlib: dynlibogr_api.}
proc OGR_FD_Create*(a1: cstring): OGRFeatureDefnH {.stdcall,
    importc: "OGR_FD_Create", dynlib: dynlibogr_api.}
proc OGR_FD_Destroy*(a1: OGRFeatureDefnH) {.stdcall, importc: "OGR_FD_Destroy",
    dynlib: dynlibogr_api.}
proc OGR_FD_Release*(a1: OGRFeatureDefnH) {.stdcall, importc: "OGR_FD_Release",
    dynlib: dynlibogr_api.}
proc OGR_FD_GetName*(a1: OGRFeatureDefnH): cstring {.stdcall,
    importc: "OGR_FD_GetName", dynlib: dynlibogr_api.}
proc OGR_FD_GetFieldCount*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetFieldCount", dynlib: dynlibogr_api.}
proc OGR_FD_GetFieldDefn*(a1: OGRFeatureDefnH; a2: cint): OGRFieldDefnH {.stdcall,
    importc: "OGR_FD_GetFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_GetFieldIndex*(a1: OGRFeatureDefnH; a2: cstring): cint {.stdcall,
    importc: "OGR_FD_GetFieldIndex", dynlib: dynlibogr_api.}
proc OGR_FD_AddFieldDefn*(a1: OGRFeatureDefnH; a2: OGRFieldDefnH) {.stdcall,
    importc: "OGR_FD_AddFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_DeleteFieldDefn*(hDefn: OGRFeatureDefnH; iField: cint): OGRErr {.stdcall,
    importc: "OGR_FD_DeleteFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_ReorderFieldDefns*(hDefn: OGRFeatureDefnH; panMap: ptr cint): OGRErr {.
    stdcall, importc: "OGR_FD_ReorderFieldDefns", dynlib: dynlibogr_api.}
proc OGR_FD_GetGeomType*(a1: OGRFeatureDefnH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_FD_GetGeomType", dynlib: dynlibogr_api.}
proc OGR_FD_SetGeomType*(a1: OGRFeatureDefnH; a2: OGRwkbGeometryType) {.stdcall,
    importc: "OGR_FD_SetGeomType", dynlib: dynlibogr_api.}
proc OGR_FD_IsGeometryIgnored*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_IsGeometryIgnored", dynlib: dynlibogr_api.}
proc OGR_FD_SetGeometryIgnored*(a1: OGRFeatureDefnH; a2: cint) {.stdcall,
    importc: "OGR_FD_SetGeometryIgnored", dynlib: dynlibogr_api.}
proc OGR_FD_IsStyleIgnored*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_IsStyleIgnored", dynlib: dynlibogr_api.}
proc OGR_FD_SetStyleIgnored*(a1: OGRFeatureDefnH; a2: cint) {.stdcall,
    importc: "OGR_FD_SetStyleIgnored", dynlib: dynlibogr_api.}
proc OGR_FD_Reference*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_Reference", dynlib: dynlibogr_api.}
proc OGR_FD_Dereference*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_Dereference", dynlib: dynlibogr_api.}
proc OGR_FD_GetReferenceCount*(a1: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetReferenceCount", dynlib: dynlibogr_api.}
proc OGR_FD_GetGeomFieldCount*(hFDefn: OGRFeatureDefnH): cint {.stdcall,
    importc: "OGR_FD_GetGeomFieldCount", dynlib: dynlibogr_api.}
proc OGR_FD_GetGeomFieldDefn*(hFDefn: OGRFeatureDefnH; i: cint): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_FD_GetGeomFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_GetGeomFieldIndex*(hFDefn: OGRFeatureDefnH; pszName: cstring): cint {.
    stdcall, importc: "OGR_FD_GetGeomFieldIndex", dynlib: dynlibogr_api.}
proc OGR_FD_AddGeomFieldDefn*(hFDefn: OGRFeatureDefnH; hGFldDefn: OGRGeomFieldDefnH) {.
    stdcall, importc: "OGR_FD_AddGeomFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_DeleteGeomFieldDefn*(hFDefn: OGRFeatureDefnH; iGeomField: cint): OGRErr {.
    stdcall, importc: "OGR_FD_DeleteGeomFieldDefn", dynlib: dynlibogr_api.}
proc OGR_FD_IsSame*(hFDefn: OGRFeatureDefnH; hOtherFDefn: OGRFeatureDefnH): cint {.
    stdcall, importc: "OGR_FD_IsSame", dynlib: dynlibogr_api.}
proc OGR_F_Create*(a1: OGRFeatureDefnH): OGRFeatureH {.stdcall,
    importc: "OGR_F_Create", dynlib: dynlibogr_api.}
proc OGR_F_Destroy*(a1: OGRFeatureH) {.stdcall, importc: "OGR_F_Destroy",
                                    dynlib: dynlibogr_api.}
proc OGR_F_GetDefnRef*(a1: OGRFeatureH): OGRFeatureDefnH {.stdcall,
    importc: "OGR_F_GetDefnRef", dynlib: dynlibogr_api.}
proc OGR_F_SetGeometryDirectly*(a1: OGRFeatureH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeometryDirectly", dynlib: dynlibogr_api.}
proc OGR_F_SetGeometry*(a1: OGRFeatureH; a2: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeometry", dynlib: dynlibogr_api.}
proc OGR_F_GetGeometryRef*(a1: OGRFeatureH): OGRGeometryH {.stdcall,
    importc: "OGR_F_GetGeometryRef", dynlib: dynlibogr_api.}
proc OGR_F_StealGeometry*(a1: OGRFeatureH): OGRGeometryH {.stdcall,
    importc: "OGR_F_StealGeometry", dynlib: dynlibogr_api.}
proc OGR_F_Clone*(a1: OGRFeatureH): OGRFeatureH {.stdcall, importc: "OGR_F_Clone",
    dynlib: dynlibogr_api.}
proc OGR_F_Equal*(a1: OGRFeatureH; a2: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_Equal", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldCount*(a1: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_GetFieldCount", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldDefnRef*(a1: OGRFeatureH; a2: cint): OGRFieldDefnH {.stdcall,
    importc: "OGR_F_GetFieldDefnRef", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldIndex*(a1: OGRFeatureH; a2: cstring): cint {.stdcall,
    importc: "OGR_F_GetFieldIndex", dynlib: dynlibogr_api.}
proc OGR_F_IsFieldSet*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldSet", dynlib: dynlibogr_api.}
proc OGR_F_UnsetField*(a1: OGRFeatureH; a2: cint) {.stdcall,
    importc: "OGR_F_UnsetField", dynlib: dynlibogr_api.}
proc OGR_F_IsFieldNull*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldNull", dynlib: dynlibogr_api.}
proc OGR_F_IsFieldSetAndNotNull*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_IsFieldSetAndNotNull", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldNull*(a1: OGRFeatureH; a2: cint) {.stdcall,
    importc: "OGR_F_SetFieldNull", dynlib: dynlibogr_api.}
proc OGR_F_GetRawFieldRef*(a1: OGRFeatureH; a2: cint): ptr OGRField {.stdcall,
    importc: "OGR_F_GetRawFieldRef", dynlib: dynlibogr_api.}
proc OGR_RawField_IsUnset*(a1: ptr OGRField): cint {.stdcall,
    importc: "OGR_RawField_IsUnset", dynlib: dynlibogr_api.}
proc OGR_RawField_IsNull*(a1: ptr OGRField): cint {.stdcall,
    importc: "OGR_RawField_IsNull", dynlib: dynlibogr_api.}
proc OGR_RawField_SetUnset*(a1: ptr OGRField) {.stdcall,
    importc: "OGR_RawField_SetUnset", dynlib: dynlibogr_api.}
proc OGR_RawField_SetNull*(a1: ptr OGRField) {.stdcall,
    importc: "OGR_RawField_SetNull", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsInteger*(a1: OGRFeatureH; a2: cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsInteger", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsInteger64*(a1: OGRFeatureH; a2: cint): GIntBig {.stdcall,
    importc: "OGR_F_GetFieldAsInteger64", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsDouble*(a1: OGRFeatureH; a2: cint): cdouble {.stdcall,
    importc: "OGR_F_GetFieldAsDouble", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsString*(a1: OGRFeatureH; a2: cint): cstring {.stdcall,
    importc: "OGR_F_GetFieldAsString", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsIntegerList*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr cint {.
    stdcall, importc: "OGR_F_GetFieldAsIntegerList", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsInteger64List*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr GIntBig {.
    stdcall, importc: "OGR_F_GetFieldAsInteger64List", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsDoubleList*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr cdouble {.
    stdcall, importc: "OGR_F_GetFieldAsDoubleList", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsStringList*(a1: OGRFeatureH; a2: cint): cstringArray {.stdcall,
    importc: "OGR_F_GetFieldAsStringList", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsBinary*(a1: OGRFeatureH; a2: cint; a3: ptr cint): ptr GByte {.
    stdcall, importc: "OGR_F_GetFieldAsBinary", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsDateTime*(a1: OGRFeatureH; a2: cint; a3: ptr cint; a4: ptr cint;
                              a5: ptr cint; a6: ptr cint; a7: ptr cint; a8: ptr cint;
                              a9: ptr cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsDateTime", dynlib: dynlibogr_api.}
proc OGR_F_GetFieldAsDateTimeEx*(hFeat: OGRFeatureH; iField: cint; pnYear: ptr cint;
                                pnMonth: ptr cint; pnDay: ptr cint; pnHour: ptr cint;
                                pnMinute: ptr cint; pfSecond: ptr cfloat;
                                pnTZFlag: ptr cint): cint {.stdcall,
    importc: "OGR_F_GetFieldAsDateTimeEx", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldInteger*(a1: OGRFeatureH; a2: cint; a3: cint) {.stdcall,
    importc: "OGR_F_SetFieldInteger", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldInteger64*(a1: OGRFeatureH; a2: cint; a3: GIntBig) {.stdcall,
    importc: "OGR_F_SetFieldInteger64", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldDouble*(a1: OGRFeatureH; a2: cint; a3: cdouble) {.stdcall,
    importc: "OGR_F_SetFieldDouble", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldString*(a1: OGRFeatureH; a2: cint; a3: cstring) {.stdcall,
    importc: "OGR_F_SetFieldString", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldIntegerList*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr cint) {.
    stdcall, importc: "OGR_F_SetFieldIntegerList", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldInteger64List*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr GIntBig) {.
    stdcall, importc: "OGR_F_SetFieldInteger64List", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldDoubleList*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr cdouble) {.
    stdcall, importc: "OGR_F_SetFieldDoubleList", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldStringList*(a1: OGRFeatureH; a2: cint; a3: cstringArray) {.stdcall,
    importc: "OGR_F_SetFieldStringList", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldRaw*(a1: OGRFeatureH; a2: cint; a3: ptr OGRField) {.stdcall,
    importc: "OGR_F_SetFieldRaw", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldBinary*(a1: OGRFeatureH; a2: cint; a3: cint; a4: ptr GByte) {.stdcall,
    importc: "OGR_F_SetFieldBinary", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldDateTime*(a1: OGRFeatureH; a2: cint; a3: cint; a4: cint; a5: cint;
                            a6: cint; a7: cint; a8: cint; a9: cint) {.stdcall,
    importc: "OGR_F_SetFieldDateTime", dynlib: dynlibogr_api.}
proc OGR_F_SetFieldDateTimeEx*(a1: OGRFeatureH; a2: cint; a3: cint; a4: cint; a5: cint;
                              a6: cint; a7: cint; a8: cfloat; a9: cint) {.stdcall,
    importc: "OGR_F_SetFieldDateTimeEx", dynlib: dynlibogr_api.}
proc OGR_F_GetGeomFieldCount*(hFeat: OGRFeatureH): cint {.stdcall,
    importc: "OGR_F_GetGeomFieldCount", dynlib: dynlibogr_api.}
proc OGR_F_GetGeomFieldDefnRef*(hFeat: OGRFeatureH; iField: cint): OGRGeomFieldDefnH {.
    stdcall, importc: "OGR_F_GetGeomFieldDefnRef", dynlib: dynlibogr_api.}
proc OGR_F_GetGeomFieldIndex*(hFeat: OGRFeatureH; pszName: cstring): cint {.stdcall,
    importc: "OGR_F_GetGeomFieldIndex", dynlib: dynlibogr_api.}
proc OGR_F_GetGeomFieldRef*(hFeat: OGRFeatureH; iField: cint): OGRGeometryH {.stdcall,
    importc: "OGR_F_GetGeomFieldRef", dynlib: dynlibogr_api.}
proc OGR_F_SetGeomFieldDirectly*(hFeat: OGRFeatureH; iField: cint;
                                hGeom: OGRGeometryH): OGRErr {.stdcall,
    importc: "OGR_F_SetGeomFieldDirectly", dynlib: dynlibogr_api.}
proc OGR_F_SetGeomField*(hFeat: OGRFeatureH; iField: cint; hGeom: OGRGeometryH): OGRErr {.
    stdcall, importc: "OGR_F_SetGeomField", dynlib: dynlibogr_api.}
proc OGR_F_GetFID*(a1: OGRFeatureH): GIntBig {.stdcall, importc: "OGR_F_GetFID",
    dynlib: dynlibogr_api.}
proc OGR_F_SetFID*(a1: OGRFeatureH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_F_SetFID", dynlib: dynlibogr_api.}
proc OGR_F_DumpReadable*(a1: OGRFeatureH; a2: ptr FILE) {.stdcall,
    importc: "OGR_F_DumpReadable", dynlib: dynlibogr_api.}
proc OGR_F_SetFrom*(a1: OGRFeatureH; a2: OGRFeatureH; a3: cint): OGRErr {.stdcall,
    importc: "OGR_F_SetFrom", dynlib: dynlibogr_api.}
proc OGR_F_SetFromWithMap*(a1: OGRFeatureH; a2: OGRFeatureH; a3: cint; a4: ptr cint): OGRErr {.
    stdcall, importc: "OGR_F_SetFromWithMap", dynlib: dynlibogr_api.}
proc OGR_F_GetStyleString*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetStyleString", dynlib: dynlibogr_api.}
proc OGR_F_SetStyleString*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetStyleString", dynlib: dynlibogr_api.}
proc OGR_F_SetStyleStringDirectly*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetStyleStringDirectly", dynlib: dynlibogr_api.}
proc OGR_F_GetStyleTable*(a1: OGRFeatureH): OGRStyleTableH {.stdcall,
    importc: "OGR_F_GetStyleTable", dynlib: dynlibogr_api.}
proc OGR_F_SetStyleTableDirectly*(a1: OGRFeatureH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_F_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc OGR_F_SetStyleTable*(a1: OGRFeatureH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_F_SetStyleTable", dynlib: dynlibogr_api.}
proc OGR_F_GetNativeData*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetNativeData", dynlib: dynlibogr_api.}
proc OGR_F_SetNativeData*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetNativeData", dynlib: dynlibogr_api.}
proc OGR_F_GetNativeMediaType*(a1: OGRFeatureH): cstring {.stdcall,
    importc: "OGR_F_GetNativeMediaType", dynlib: dynlibogr_api.}
proc OGR_F_SetNativeMediaType*(a1: OGRFeatureH; a2: cstring) {.stdcall,
    importc: "OGR_F_SetNativeMediaType", dynlib: dynlibogr_api.}
proc OGR_F_FillUnsetWithDefault*(hFeat: OGRFeatureH; bNotNullableOnly: cint;
                                papszOptions: cstringArray) {.stdcall,
    importc: "OGR_F_FillUnsetWithDefault", dynlib: dynlibogr_api.}
proc OGR_F_Validate*(a1: OGRFeatureH; nValidateFlags: cint; bEmitError: cint): cint {.
    stdcall, importc: "OGR_F_Validate", dynlib: dynlibogr_api.}
type
  OGRLayer = object
  OGRLayerH* = ptr OGRLayer
  OGRDataSource = object
  OGRDataSourceH* = ptr OGRDataSource
  OGRSFDriver = object
  OGRSFDriverH* = ptr OGRSFDriver

proc OGR_L_GetName*(a1: OGRLayerH): cstring {.stdcall, importc: "OGR_L_GetName",
    dynlib: dynlibogr_api.}
proc OGR_L_GetGeomType*(a1: OGRLayerH): OGRwkbGeometryType {.stdcall,
    importc: "OGR_L_GetGeomType", dynlib: dynlibogr_api.}
proc OGR_L_GetSpatialFilter*(a1: OGRLayerH): OGRGeometryH {.stdcall,
    importc: "OGR_L_GetSpatialFilter", dynlib: dynlibogr_api.}
proc OGR_L_SetSpatialFilter*(a1: OGRLayerH; a2: OGRGeometryH) {.stdcall,
    importc: "OGR_L_SetSpatialFilter", dynlib: dynlibogr_api.}
proc OGR_L_SetSpatialFilterRect*(a1: OGRLayerH; a2: cdouble; a3: cdouble; a4: cdouble;
                                a5: cdouble) {.stdcall,
    importc: "OGR_L_SetSpatialFilterRect", dynlib: dynlibogr_api.}
proc OGR_L_SetSpatialFilterEx*(a1: OGRLayerH; iGeomField: cint; hGeom: OGRGeometryH) {.
    stdcall, importc: "OGR_L_SetSpatialFilterEx", dynlib: dynlibogr_api.}
proc OGR_L_SetSpatialFilterRectEx*(a1: OGRLayerH; iGeomField: cint; dfMinX: cdouble;
                                  dfMinY: cdouble; dfMaxX: cdouble; dfMaxY: cdouble) {.
    stdcall, importc: "OGR_L_SetSpatialFilterRectEx", dynlib: dynlibogr_api.}
proc OGR_L_SetAttributeFilter*(a1: OGRLayerH; a2: cstring): OGRErr {.stdcall,
    importc: "OGR_L_SetAttributeFilter", dynlib: dynlibogr_api.}
proc OGR_L_ResetReading*(a1: OGRLayerH) {.stdcall, importc: "OGR_L_ResetReading",
                                       dynlib: dynlibogr_api.}
proc OGR_L_GetNextFeature*(a1: OGRLayerH): OGRFeatureH {.stdcall,
    importc: "OGR_L_GetNextFeature", dynlib: dynlibogr_api.}
proc OGR_L_SetNextByIndex*(a1: OGRLayerH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_L_SetNextByIndex", dynlib: dynlibogr_api.}
proc OGR_L_GetFeature*(a1: OGRLayerH; a2: GIntBig): OGRFeatureH {.stdcall,
    importc: "OGR_L_GetFeature", dynlib: dynlibogr_api.}
proc OGR_L_SetFeature*(a1: OGRLayerH; a2: OGRFeatureH): OGRErr {.stdcall,
    importc: "OGR_L_SetFeature", dynlib: dynlibogr_api.}
proc OGR_L_CreateFeature*(a1: OGRLayerH; a2: OGRFeatureH): OGRErr {.stdcall,
    importc: "OGR_L_CreateFeature", dynlib: dynlibogr_api.}
proc OGR_L_DeleteFeature*(a1: OGRLayerH; a2: GIntBig): OGRErr {.stdcall,
    importc: "OGR_L_DeleteFeature", dynlib: dynlibogr_api.}
proc OGR_L_GetLayerDefn*(a1: OGRLayerH): OGRFeatureDefnH {.stdcall,
    importc: "OGR_L_GetLayerDefn", dynlib: dynlibogr_api.}
proc OGR_L_GetSpatialRef*(a1: OGRLayerH): OGRSpatialReferenceH {.stdcall,
    importc: "OGR_L_GetSpatialRef", dynlib: dynlibogr_api.}
proc OGR_L_FindFieldIndex*(a1: OGRLayerH; a2: cstring; bExactMatch: cint): cint {.
    stdcall, importc: "OGR_L_FindFieldIndex", dynlib: dynlibogr_api.}
proc OGR_L_GetFeatureCount*(a1: OGRLayerH; a2: cint): GIntBig {.stdcall,
    importc: "OGR_L_GetFeatureCount", dynlib: dynlibogr_api.}
proc OGR_L_GetExtent*(a1: OGRLayerH; a2: ptr OGREnvelope; a3: cint): OGRErr {.stdcall,
    importc: "OGR_L_GetExtent", dynlib: dynlibogr_api.}
proc OGR_L_GetExtentEx*(a1: OGRLayerH; iGeomField: cint; psExtent: ptr OGREnvelope;
                       bForce: cint): OGRErr {.stdcall,
    importc: "OGR_L_GetExtentEx", dynlib: dynlibogr_api.}
proc OGR_L_TestCapability*(a1: OGRLayerH; a2: cstring): cint {.stdcall,
    importc: "OGR_L_TestCapability", dynlib: dynlibogr_api.}
proc OGR_L_CreateField*(a1: OGRLayerH; a2: OGRFieldDefnH; a3: cint): OGRErr {.stdcall,
    importc: "OGR_L_CreateField", dynlib: dynlibogr_api.}
proc OGR_L_CreateGeomField*(hLayer: OGRLayerH; hFieldDefn: OGRGeomFieldDefnH;
                           bForce: cint): OGRErr {.stdcall,
    importc: "OGR_L_CreateGeomField", dynlib: dynlibogr_api.}
proc OGR_L_DeleteField*(a1: OGRLayerH; iField: cint): OGRErr {.stdcall,
    importc: "OGR_L_DeleteField", dynlib: dynlibogr_api.}
proc OGR_L_ReorderFields*(a1: OGRLayerH; panMap: ptr cint): OGRErr {.stdcall,
    importc: "OGR_L_ReorderFields", dynlib: dynlibogr_api.}
proc OGR_L_ReorderField*(a1: OGRLayerH; iOldFieldPos: cint; iNewFieldPos: cint): OGRErr {.
    stdcall, importc: "OGR_L_ReorderField", dynlib: dynlibogr_api.}
proc OGR_L_AlterFieldDefn*(a1: OGRLayerH; iField: cint; hNewFieldDefn: OGRFieldDefnH;
                          nFlags: cint): OGRErr {.stdcall,
    importc: "OGR_L_AlterFieldDefn", dynlib: dynlibogr_api.}
proc OGR_L_StartTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_StartTransaction", dynlib: dynlibogr_api.}
proc OGR_L_CommitTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_CommitTransaction", dynlib: dynlibogr_api.}
proc OGR_L_RollbackTransaction*(a1: OGRLayerH): OGRErr {.stdcall,
    importc: "OGR_L_RollbackTransaction", dynlib: dynlibogr_api.}
proc OGR_L_Reference*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_Reference",
    dynlib: dynlibogr_api.}
proc OGR_L_Dereference*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_Dereference",
    dynlib: dynlibogr_api.}
proc OGR_L_GetRefCount*(a1: OGRLayerH): cint {.stdcall, importc: "OGR_L_GetRefCount",
    dynlib: dynlibogr_api.}
proc OGR_L_SyncToDisk*(a1: OGRLayerH): OGRErr {.stdcall, importc: "OGR_L_SyncToDisk",
    dynlib: dynlibogr_api.}
proc OGR_L_GetFeaturesRead*(a1: OGRLayerH): GIntBig {.stdcall,
    importc: "OGR_L_GetFeaturesRead", dynlib: dynlibogr_api.}
proc OGR_L_GetFIDColumn*(a1: OGRLayerH): cstring {.stdcall,
    importc: "OGR_L_GetFIDColumn", dynlib: dynlibogr_api.}
proc OGR_L_GetGeometryColumn*(a1: OGRLayerH): cstring {.stdcall,
    importc: "OGR_L_GetGeometryColumn", dynlib: dynlibogr_api.}
proc OGR_L_GetStyleTable*(a1: OGRLayerH): OGRStyleTableH {.stdcall,
    importc: "OGR_L_GetStyleTable", dynlib: dynlibogr_api.}
proc OGR_L_SetStyleTableDirectly*(a1: OGRLayerH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_L_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc OGR_L_SetStyleTable*(a1: OGRLayerH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_L_SetStyleTable", dynlib: dynlibogr_api.}
proc OGR_L_SetIgnoredFields*(a1: OGRLayerH; a2: cstringArray): OGRErr {.stdcall,
    importc: "OGR_L_SetIgnoredFields", dynlib: dynlibogr_api.}
proc OGR_L_Intersection*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                        a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Intersection", dynlib: dynlibogr_api.}
proc OGR_L_Union*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                 a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Union", dynlib: dynlibogr_api.}
proc OGR_L_SymDifference*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH;
                         a4: cstringArray; a5: GDALProgressFunc; a6: pointer): OGRErr {.
    stdcall, importc: "OGR_L_SymDifference", dynlib: dynlibogr_api.}
proc OGR_L_Identity*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                    a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Identity", dynlib: dynlibogr_api.}
proc OGR_L_Update*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                  a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Update", dynlib: dynlibogr_api.}
proc OGR_L_Clip*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Clip", dynlib: dynlibogr_api.}
proc OGR_L_Erase*(a1: OGRLayerH; a2: OGRLayerH; a3: OGRLayerH; a4: cstringArray;
                 a5: GDALProgressFunc; a6: pointer): OGRErr {.stdcall,
    importc: "OGR_L_Erase", dynlib: dynlibogr_api.}
proc OGR_DS_Destroy*(a1: OGRDataSourceH) {.stdcall, importc: "OGR_DS_Destroy",
                                        dynlib: dynlibogr_api.}
proc OGR_DS_GetName*(a1: OGRDataSourceH): cstring {.stdcall,
    importc: "OGR_DS_GetName", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayerCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetLayerCount", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayer*(a1: OGRDataSourceH; a2: cint): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayer", dynlib: dynlibogr_api.}
proc OGR_DS_GetLayerByName*(a1: OGRDataSourceH; a2: cstring): OGRLayerH {.stdcall,
    importc: "OGR_DS_GetLayerByName", dynlib: dynlibogr_api.}
proc OGR_DS_DeleteLayer*(a1: OGRDataSourceH; a2: cint): OGRErr {.stdcall,
    importc: "OGR_DS_DeleteLayer", dynlib: dynlibogr_api.}
proc OGR_DS_GetDriver*(a1: OGRDataSourceH): OGRSFDriverH {.stdcall,
    importc: "OGR_DS_GetDriver", dynlib: dynlibogr_api.}
proc OGR_DS_CreateLayer*(a1: OGRDataSourceH; a2: cstring; a3: OGRSpatialReferenceH;
                        a4: OGRwkbGeometryType; a5: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CreateLayer", dynlib: dynlibogr_api.}
proc OGR_DS_CopyLayer*(a1: OGRDataSourceH; a2: OGRLayerH; a3: cstring; a4: cstringArray): OGRLayerH {.
    stdcall, importc: "OGR_DS_CopyLayer", dynlib: dynlibogr_api.}
proc OGR_DS_TestCapability*(a1: OGRDataSourceH; a2: cstring): cint {.stdcall,
    importc: "OGR_DS_TestCapability", dynlib: dynlibogr_api.}
proc OGR_DS_ExecuteSQL*(a1: OGRDataSourceH; a2: cstring; a3: OGRGeometryH; a4: cstring): OGRLayerH {.
    stdcall, importc: "OGR_DS_ExecuteSQL", dynlib: dynlibogr_api.}
proc OGR_DS_ReleaseResultSet*(a1: OGRDataSourceH; a2: OGRLayerH) {.stdcall,
    importc: "OGR_DS_ReleaseResultSet", dynlib: dynlibogr_api.}
proc OGR_DS_Reference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Reference", dynlib: dynlibogr_api.}
proc OGR_DS_Dereference*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_Dereference", dynlib: dynlibogr_api.}
proc OGR_DS_GetRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetRefCount", dynlib: dynlibogr_api.}
proc OGR_DS_GetSummaryRefCount*(a1: OGRDataSourceH): cint {.stdcall,
    importc: "OGR_DS_GetSummaryRefCount", dynlib: dynlibogr_api.}
proc OGR_DS_SyncToDisk*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGR_DS_SyncToDisk", dynlib: dynlibogr_api.}
proc OGR_DS_GetStyleTable*(a1: OGRDataSourceH): OGRStyleTableH {.stdcall,
    importc: "OGR_DS_GetStyleTable", dynlib: dynlibogr_api.}
proc OGR_DS_SetStyleTableDirectly*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTableDirectly", dynlib: dynlibogr_api.}
proc OGR_DS_SetStyleTable*(a1: OGRDataSourceH; a2: OGRStyleTableH) {.stdcall,
    importc: "OGR_DS_SetStyleTable", dynlib: dynlibogr_api.}
proc OGR_Dr_GetName*(a1: OGRSFDriverH): cstring {.stdcall, importc: "OGR_Dr_GetName",
    dynlib: dynlibogr_api.}
proc OGR_Dr_Open*(a1: OGRSFDriverH; a2: cstring; a3: cint): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_Open", dynlib: dynlibogr_api.}
proc OGR_Dr_TestCapability*(a1: OGRSFDriverH; a2: cstring): cint {.stdcall,
    importc: "OGR_Dr_TestCapability", dynlib: dynlibogr_api.}
proc OGR_Dr_CreateDataSource*(a1: OGRSFDriverH; a2: cstring; a3: cstringArray): OGRDataSourceH {.
    stdcall, importc: "OGR_Dr_CreateDataSource", dynlib: dynlibogr_api.}
proc OGR_Dr_CopyDataSource*(a1: OGRSFDriverH; a2: OGRDataSourceH; a3: cstring;
                           a4: cstringArray): OGRDataSourceH {.stdcall,
    importc: "OGR_Dr_CopyDataSource", dynlib: dynlibogr_api.}
proc OGR_Dr_DeleteDataSource*(a1: OGRSFDriverH; a2: cstring): OGRErr {.stdcall,
    importc: "OGR_Dr_DeleteDataSource", dynlib: dynlibogr_api.}
proc OGROpen*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.stdcall,
    importc: "OGROpen", dynlib: dynlibogr_api.}
proc OGROpenShared*(a1: cstring; a2: cint; a3: ptr OGRSFDriverH): OGRDataSourceH {.
    stdcall, importc: "OGROpenShared", dynlib: dynlibogr_api.}
proc OGRReleaseDataSource*(a1: OGRDataSourceH): OGRErr {.stdcall,
    importc: "OGRReleaseDataSource", dynlib: dynlibogr_api.}
proc OGRRegisterDriver*(a1: OGRSFDriverH) {.stdcall, importc: "OGRRegisterDriver",
    dynlib: dynlibogr_api.}
proc OGRDeregisterDriver*(a1: OGRSFDriverH) {.stdcall,
    importc: "OGRDeregisterDriver", dynlib: dynlibogr_api.}
proc OGRGetDriverCount*(): cint {.stdcall, importc: "OGRGetDriverCount",
                               dynlib: dynlibogr_api.}
proc OGRGetDriver*(a1: cint): OGRSFDriverH {.stdcall, importc: "OGRGetDriver",
    dynlib: dynlibogr_api.}
proc OGRGetDriverByName*(a1: cstring): OGRSFDriverH {.stdcall,
    importc: "OGRGetDriverByName", dynlib: dynlibogr_api.}
proc OGRGetOpenDSCount*(): cint {.stdcall, importc: "OGRGetOpenDSCount",
                               dynlib: dynlibogr_api.}
proc OGRGetOpenDS*(iDS: cint): OGRDataSourceH {.stdcall, importc: "OGRGetOpenDS",
    dynlib: dynlibogr_api.}
proc OGRRegisterAll*() {.stdcall, importc: "OGRRegisterAll", dynlib: dynlibogr_api.}
proc OGRCleanupAll*() {.stdcall, importc: "OGRCleanupAll", dynlib: dynlibogr_api.}
type
  OGRStyleMgr = object
  OGRStyleMgrH* = ptr OGRStyleMgr
  OGRStyleTool = object
  OGRStyleToolH* = ptr OGRStyleTool

proc OGR_SM_Create*(hStyleTable: OGRStyleTableH): OGRStyleMgrH {.stdcall,
    importc: "OGR_SM_Create", dynlib: dynlibogr_api.}
proc OGR_SM_Destroy*(hSM: OGRStyleMgrH) {.stdcall, importc: "OGR_SM_Destroy",
                                       dynlib: dynlibogr_api.}
proc OGR_SM_InitFromFeature*(hSM: OGRStyleMgrH; hFeat: OGRFeatureH): cstring {.
    stdcall, importc: "OGR_SM_InitFromFeature", dynlib: dynlibogr_api.}
proc OGR_SM_InitStyleString*(hSM: OGRStyleMgrH; pszStyleString: cstring): cint {.
    stdcall, importc: "OGR_SM_InitStyleString", dynlib: dynlibogr_api.}
proc OGR_SM_GetPartCount*(hSM: OGRStyleMgrH; pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_SM_GetPartCount", dynlib: dynlibogr_api.}
proc OGR_SM_GetPart*(hSM: OGRStyleMgrH; nPartId: cint; pszStyleString: cstring): OGRStyleToolH {.
    stdcall, importc: "OGR_SM_GetPart", dynlib: dynlibogr_api.}
proc OGR_SM_AddPart*(hSM: OGRStyleMgrH; hST: OGRStyleToolH): cint {.stdcall,
    importc: "OGR_SM_AddPart", dynlib: dynlibogr_api.}
proc OGR_SM_AddStyle*(hSM: OGRStyleMgrH; pszStyleName: cstring;
                     pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_SM_AddStyle", dynlib: dynlibogr_api.}
proc OGR_ST_Create*(eClassId: OGRSTClassId): OGRStyleToolH {.stdcall,
    importc: "OGR_ST_Create", dynlib: dynlibogr_api.}
proc OGR_ST_Destroy*(hST: OGRStyleToolH) {.stdcall, importc: "OGR_ST_Destroy",
                                        dynlib: dynlibogr_api.}
proc OGR_ST_GetType*(hST: OGRStyleToolH): OGRSTClassId {.stdcall,
    importc: "OGR_ST_GetType", dynlib: dynlibogr_api.}
proc OGR_ST_GetUnit*(hST: OGRStyleToolH): OGRSTUnitId {.stdcall,
    importc: "OGR_ST_GetUnit", dynlib: dynlibogr_api.}
proc OGR_ST_SetUnit*(hST: OGRStyleToolH; eUnit: OGRSTUnitId;
                    dfGroundPaperScale: cdouble) {.stdcall,
    importc: "OGR_ST_SetUnit", dynlib: dynlibogr_api.}
proc OGR_ST_GetParamStr*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cstring {.
    stdcall, importc: "OGR_ST_GetParamStr", dynlib: dynlibogr_api.}
proc OGR_ST_GetParamNum*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cint {.
    stdcall, importc: "OGR_ST_GetParamNum", dynlib: dynlibogr_api.}
proc OGR_ST_GetParamDbl*(hST: OGRStyleToolH; eParam: cint; bValueIsNull: ptr cint): cdouble {.
    stdcall, importc: "OGR_ST_GetParamDbl", dynlib: dynlibogr_api.}
proc OGR_ST_SetParamStr*(hST: OGRStyleToolH; eParam: cint; pszValue: cstring) {.
    stdcall, importc: "OGR_ST_SetParamStr", dynlib: dynlibogr_api.}
proc OGR_ST_SetParamNum*(hST: OGRStyleToolH; eParam: cint; nValue: cint) {.stdcall,
    importc: "OGR_ST_SetParamNum", dynlib: dynlibogr_api.}
proc OGR_ST_SetParamDbl*(hST: OGRStyleToolH; eParam: cint; dfValue: cdouble) {.stdcall,
    importc: "OGR_ST_SetParamDbl", dynlib: dynlibogr_api.}
proc OGR_ST_GetStyleString*(hST: OGRStyleToolH): cstring {.stdcall,
    importc: "OGR_ST_GetStyleString", dynlib: dynlibogr_api.}
proc OGR_ST_GetRGBFromString*(hST: OGRStyleToolH; pszColor: cstring; pnRed: ptr cint;
                             pnGreen: ptr cint; pnBlue: ptr cint; pnAlpha: ptr cint): cint {.
    stdcall, importc: "OGR_ST_GetRGBFromString", dynlib: dynlibogr_api.}
proc OGR_STBL_Create*(): OGRStyleTableH {.stdcall, importc: "OGR_STBL_Create",
                                       dynlib: dynlibogr_api.}
proc OGR_STBL_Destroy*(hSTBL: OGRStyleTableH) {.stdcall,
    importc: "OGR_STBL_Destroy", dynlib: dynlibogr_api.}
proc OGR_STBL_AddStyle*(hStyleTable: OGRStyleTableH; pszName: cstring;
                       pszStyleString: cstring): cint {.stdcall,
    importc: "OGR_STBL_AddStyle", dynlib: dynlibogr_api.}
proc OGR_STBL_SaveStyleTable*(hStyleTable: OGRStyleTableH; pszFilename: cstring): cint {.
    stdcall, importc: "OGR_STBL_SaveStyleTable", dynlib: dynlibogr_api.}
proc OGR_STBL_LoadStyleTable*(hStyleTable: OGRStyleTableH; pszFilename: cstring): cint {.
    stdcall, importc: "OGR_STBL_LoadStyleTable", dynlib: dynlibogr_api.}
proc OGR_STBL_Find*(hStyleTable: OGRStyleTableH; pszName: cstring): cstring {.stdcall,
    importc: "OGR_STBL_Find", dynlib: dynlibogr_api.}
proc OGR_STBL_ResetStyleStringReading*(hStyleTable: OGRStyleTableH) {.stdcall,
    importc: "OGR_STBL_ResetStyleStringReading", dynlib: dynlibogr_api.}
proc OGR_STBL_GetNextStyle*(hStyleTable: OGRStyleTableH): cstring {.stdcall,
    importc: "OGR_STBL_GetNextStyle", dynlib: dynlibogr_api.}
proc OGR_STBL_GetLastStyleName*(hStyleTable: OGRStyleTableH): cstring {.stdcall,
    importc: "OGR_STBL_GetLastStyleName", dynlib: dynlibogr_api.}