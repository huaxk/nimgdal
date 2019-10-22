#import wrap/cpl_port
when defined(Windows):
  const dynlibogr_core = "libgdal.dll"

when defined(Linux):
  const dynlibogr_core = "libgdal.so"

when defined(MacOSX):
  const dynlibogr_core = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
const
  OGRERR_NONE* = 0
  OGRERR_NOT_ENOUGH_DATA* = 1
  OGRERR_NOT_ENOUGH_MEMORY* = 2
  OGRERR_UNSUPPORTED_GEOMETRY_TYPE* = 3
  OGRERR_UNSUPPORTED_OPERATION* = 4
  OGRERR_CORRUPT_DATA* = 5
  OGRERR_FAILURE* = 6
  OGRERR_UNSUPPORTED_SRS* = 7
  OGRERR_INVALID_HANDLE* = 8
  OGRERR_NON_EXISTING_FEATURE* = 9
  wkb25DBit* = 0x80000000
  ogrZMarker* = 0x21125711
  ALTER_NAME_FLAG* = 0x00000001
  ALTER_TYPE_FLAG* = 0x00000002
  ALTER_WIDTH_PRECISION_FLAG* = 0x00000004
  ALTER_NULLABLE_FLAG* = 0x00000008
  ALTER_DEFAULT_FLAG* = 0x00000010
  OGR_F_VAL_NULL* = 0x00000001
  OGR_F_VAL_GEOM_TYPE* = 0x00000002
  OGR_F_VAL_WIDTH* = 0x00000004
  OGR_F_VAL_ALLOW_NULL_WHEN_DEFAULT* = 0x00000008
  OGR_F_VAL_ALLOW_DIFFERENT_GEOM_DIM* = 0x00000010
  OGRNullFID* = -1
  OGRUnsetMarker* = -21121
  OGRNullMarker* = -21122

type
  OGREnvelope* {.bycopy.} = object
    MinX*: cdouble
    MaxX*: cdouble
    MinY*: cdouble
    MaxY*: cdouble

  OGREnvelope3D* {.bycopy.} = object
    MinX*: cdouble
    MaxX*: cdouble
    MinY*: cdouble
    MaxY*: cdouble
    MinZ*: cdouble
    MaxZ*: cdouble

  OGRErr* = cint
  OGRBoolean* = cint
  OGRwkbGeometryType* {.size: sizeof(cint).} = enum
    wkbUnknown = 0, wkbPoint = 1, wkbLineString = 2, wkbPolygon = 3, wkbMultiPoint = 4,
    wkbMultiLineString = 5, wkbMultiPolygon = 6, wkbGeometryCollection = 7,
    wkbCircularString = 8, wkbCompoundCurve = 9, wkbCurvePolygon = 10,
    wkbMultiCurve = 11, wkbMultiSurface = 12, wkbCurve = 13, wkbSurface = 14,
    wkbPolyhedralSurface = 15, wkbTIN = 16, wkbTriangle = 17, wkbNone = 100,
    wkbLinearRing = 101, wkbCircularStringZ = 1008, wkbCompoundCurveZ = 1009,
    wkbCurvePolygonZ = 1010, wkbMultiCurveZ = 1011, wkbMultiSurfaceZ = 1012,
    wkbCurveZ = 1013, wkbSurfaceZ = 1014, wkbPolyhedralSurfaceZ = 1015, wkbTINZ = 1016,
    wkbTriangleZ = 1017, wkbPointM = 2001, wkbLineStringM = 2002, wkbPolygonM = 2003,
    wkbMultiPointM = 2004, wkbMultiLineStringM = 2005, wkbMultiPolygonM = 2006,
    wkbGeometryCollectionM = 2007, wkbCircularStringM = 2008,
    wkbCompoundCurveM = 2009, wkbCurvePolygonM = 2010, wkbMultiCurveM = 2011,
    wkbMultiSurfaceM = 2012, wkbCurveM = 2013, wkbSurfaceM = 2014,
    wkbPolyhedralSurfaceM = 2015, wkbTINM = 2016, wkbTriangleM = 2017, wkbPointZM = 3001,
    wkbLineStringZM = 3002, wkbPolygonZM = 3003, wkbMultiPointZM = 3004,
    wkbMultiLineStringZM = 3005, wkbMultiPolygonZM = 3006,
    wkbGeometryCollectionZM = 3007, wkbCircularStringZM = 3008,
    wkbCompoundCurveZM = 3009, wkbCurvePolygonZM = 3010, wkbMultiCurveZM = 3011,
    wkbMultiSurfaceZM = 3012, wkbCurveZM = 3013, wkbSurfaceZM = 3014,
    wkbPolyhedralSurfaceZM = 3015, wkbTINZM = 3016, wkbTriangleZM = 3017,
    wkbPoint25D = 0x80000001, wkbLineString25D = 0x80000002,
    wkbPolygon25D = 0x80000003, wkbMultiPoint25D = 0x80000004,
    wkbMultiLineString25D = 0x80000005, wkbMultiPolygon25D = 0x80000006,
    wkbGeometryCollection25D = 0x80000007
  OGRwkbVariant* {.size: sizeof(cint).} = enum
    wkbVariantOldOgc, wkbVariantIso, wkbVariantPostGIS1



proc geometryTypeToName*(eType: OGRwkbGeometryType): cstring {.stdcall,
    importc: "OGRGeometryTypeToName", dynlib: dynlibogr_core.}
proc mergeGeometryTypes*(eMain: OGRwkbGeometryType; eExtra: OGRwkbGeometryType): OGRwkbGeometryType {.
    stdcall, importc: "OGRMergeGeometryTypes", dynlib: dynlibogr_core.}
proc mergeGeometryTypesEx*(eMain: OGRwkbGeometryType;
                             eExtra: OGRwkbGeometryType;
                             bAllowPromotingToCurves: cint): OGRwkbGeometryType {.
    stdcall, importc: "OGRMergeGeometryTypesEx", dynlib: dynlibogr_core.}
proc flatten*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_Flatten", dynlib: dynlibogr_core.}
proc setZ*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_SetZ", dynlib: dynlibogr_core.}
proc setM*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_SetM", dynlib: dynlibogr_core.}
proc setModifier*(eType: OGRwkbGeometryType; bSetZ: cint; bSetM: cint): OGRwkbGeometryType {.
    stdcall, importc: "OGR_GT_SetModifier", dynlib: dynlibogr_core.}
proc hasZ*(eType: OGRwkbGeometryType): cint {.stdcall, importc: "OGR_GT_HasZ",
    dynlib: dynlibogr_core.}
proc hasM*(eType: OGRwkbGeometryType): cint {.stdcall, importc: "OGR_GT_HasM",
    dynlib: dynlibogr_core.}
proc isSubClassOf*(eType: OGRwkbGeometryType; eSuperType: OGRwkbGeometryType): cint {.
    stdcall, importc: "OGR_GT_IsSubClassOf", dynlib: dynlibogr_core.}
proc isCurve*(a1: OGRwkbGeometryType): cint {.stdcall,
    importc: "OGR_GT_IsCurve", dynlib: dynlibogr_core.}
proc isSurface*(a1: OGRwkbGeometryType): cint {.stdcall,
    importc: "OGR_GT_IsSurface", dynlib: dynlibogr_core.}
proc isNonLinear*(a1: OGRwkbGeometryType): cint {.stdcall,
    importc: "OGR_GT_IsNonLinear", dynlib: dynlibogr_core.}
proc getCollection*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_GetCollection", dynlib: dynlibogr_core.}
proc getCurve*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_GetCurve", dynlib: dynlibogr_core.}
proc getLinear*(eType: OGRwkbGeometryType): OGRwkbGeometryType {.stdcall,
    importc: "OGR_GT_GetLinear", dynlib: dynlibogr_core.}
type
  #INNER_C_STRUCT_temp-ogr_core.nim_213* {.bycopy.} = object
#    nCount*: cint
#    paList*: ptr cint
#
#  INNER_C_STRUCT_temp-ogr_core.nim_217* {.bycopy.} = object
#    nCount*: cint
#    paList*: ptr GIntBig
#
#  INNER_C_STRUCT_temp-ogr_core.nim_221* {.bycopy.} = object
#    nCount*: cint
#    paList*: ptr cdouble
#
#  INNER_C_STRUCT_temp-ogr_core.nim_225* {.bycopy.} = object
#    nCount*: cint
#    paList*: cstringArray
#
#  INNER_C_STRUCT_temp-ogr_core.nim_229* {.bycopy.} = object
#    nCount*: cint
#    paData*: ptr GByte
#
#  INNER_C_STRUCT_temp-ogr_core.nim_233* {.bycopy.} = object
#    nMarker1*: cint
#    nMarker2*: cint
#    nMarker3*: cint
#
#  INNER_C_STRUCT_temp-ogr_core.nim_238* {.bycopy.} = object
#    Year*: GInt16
#    Month*: GByte
#    Day*: GByte
#    Hour*: GByte
#    Minute*: GByte
#    TZFlag*: GByte
#    Reserved*: GByte
#    Second*: cfloat

  OGRwkbByteOrder* {.size: sizeof(cint).} = enum
    wkbXDR = 0, wkbNDR = 1
  OGRFieldType* {.size: sizeof(cint).} = enum
    OFTInteger = 0, OFTIntegerList = 1, OFTReal = 2, OFTRealList = 3, OFTString = 4,
    OFTStringList = 5, OFTWideString = 6, OFTWideStringList = 7, OFTBinary = 8, OFTDate = 9,
    OFTTime = 10, OFTDateTime = 11, OFTInteger64 = 12, OFTInteger64List = 13
  OGRFieldSubType* {.size: sizeof(cint).} = enum
    OFSTNone = 0, OFSTBoolean = 1, OFSTInt16 = 2, OFSTFloat32 = 3
  OGRJustification* {.size: sizeof(cint).} = enum
    OJUndefined = 0, OJLeft = 1, OJRight = 2
  OGRField* {.bycopy.} = object
#  OGRField* {.bycopy.} = object {.union.}
#    Integer*: cint
#    Integer64*: GIntBig
#    Real*: cdouble
#    String*: cstring
#    IntegerList*: INNER_C_STRUCT_temp-ogr_core.nim_213
#    Integer64List*: INNER_C_STRUCT_temp-ogr_core.nim_217
#    RealList*: INNER_C_STRUCT_temp-ogr_core.nim_221
#    StringList*: INNER_C_STRUCT_temp-ogr_core.nim_225
#    Binary*: INNER_C_STRUCT_temp-ogr_core.nim_229
#    Set*: INNER_C_STRUCT_temp-ogr_core.nim_233
#    Date*: INNER_C_STRUCT_temp-ogr_core.nim_238



#const
#  OFTMaxType = OFTInteger64List

#const
#  OFSTMaxSubType = OFSTFloat32


proc parseDate*(pszInput: cstring; psOutput: ptr OGRField; nOptions: cint): cint {.
    stdcall, importc: "OGRParseDate", dynlib: dynlibogr_core.}
type
  OGRSTClassId* {.size: sizeof(cint).} = enum
    OGRSTCNone = 0, OGRSTCPen = 1, OGRSTCBrush = 2, OGRSTCSymbol = 3, OGRSTCLabel = 4,
    OGRSTCVector = 5
  OGRSTUnitId* {.size: sizeof(cint).} = enum
    OGRSTUGround = 0, OGRSTUPixel = 1, OGRSTUPoints = 2, OGRSTUMM = 3, OGRSTUCM = 4,
    OGRSTUInches = 5
  OGRSTPenParam* {.size: sizeof(cint).} = enum
    OGRSTPenColor = 0, OGRSTPenWidth = 1, OGRSTPenPattern = 2, OGRSTPenId = 3,
    OGRSTPenPerOffset = 4, OGRSTPenCap = 5, OGRSTPenJoin = 6, OGRSTPenPriority = 7,
    OGRSTPenLast = 8
  OGRSTBrushParam* {.size: sizeof(cint).} = enum
    OGRSTBrushFColor = 0, OGRSTBrushBColor = 1, OGRSTBrushId = 2, OGRSTBrushAngle = 3,
    OGRSTBrushSize = 4, OGRSTBrushDx = 5, OGRSTBrushDy = 6, OGRSTBrushPriority = 7,
    OGRSTBrushLast = 8
  OGRSTSymbolParam* {.size: sizeof(cint).} = enum
    OGRSTSymbolId = 0, OGRSTSymbolAngle = 1, OGRSTSymbolColor = 2, OGRSTSymbolSize = 3,
    OGRSTSymbolDx = 4, OGRSTSymbolDy = 5, OGRSTSymbolStep = 6, OGRSTSymbolPerp = 7,
    OGRSTSymbolOffset = 8, OGRSTSymbolPriority = 9, OGRSTSymbolFontName = 10,
    OGRSTSymbolOColor = 11, OGRSTSymbolLast = 12
  OGRSTLabelParam* {.size: sizeof(cint).} = enum
    OGRSTLabelFontName = 0, OGRSTLabelSize = 1, OGRSTLabelTextString = 2,
    OGRSTLabelAngle = 3, OGRSTLabelFColor = 4, OGRSTLabelBColor = 5,
    OGRSTLabelPlacement = 6, OGRSTLabelAnchor = 7, OGRSTLabelDx = 8, OGRSTLabelDy = 9,
    OGRSTLabelPerp = 10, OGRSTLabelBold = 11, OGRSTLabelItalic = 12,
    OGRSTLabelUnderline = 13, OGRSTLabelPriority = 14, OGRSTLabelStrikeout = 15,
    OGRSTLabelStretch = 16, OGRSTLabelAdjHor = 17, OGRSTLabelAdjVert = 18,
    OGRSTLabelHColor = 19, OGRSTLabelOColor = 20, OGRSTLabelLast = 21







proc versionInfo*(a1: cstring): cstring {.stdcall, importc: "GDALVersionInfo",
    dynlib: dynlibogr_core.}
proc checkVersion*(nVersionMajor: cint; nVersionMinor: cint;
                      pszCallingComponentName: cstring): cint {.stdcall,
    importc: "GDALCheckVersion", dynlib: dynlibogr_core.}