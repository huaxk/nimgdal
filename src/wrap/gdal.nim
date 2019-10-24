import cpl_port
import cpl_error
import cpl_progress
import cpl_virtualmem
import cpl_minixml
import ogr_api
#import src/wrap/raw/cpl_port
#import src/wrap/raw/cpl_error
#import src/wrap/raw/cpl_progress
#import src/wrap/raw/cpl_virtualmem
#import src/wrap/raw/cpl_minixml
#import src/wrap/raw/ogr_api
when defined(Windows):
  const dynlibgdal = "libgdal.dll"

when defined(Linux):
  const dynlibgdal = "libgdal.so"

when defined(MacOSX):
  const dynlibgdal = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
const
  RASTERIO_EXTRA_ARG_CURRENT_VERSION* = 1
  GDAL_OF_READONLY* = 0x00000000
  GDAL_OF_UPDATE* = 0x00000001
  GDAL_OF_ALL* = 0x00000000
  GDAL_OF_RASTER* = 0x00000002
  GDAL_OF_VECTOR* = 0x00000004
  GDAL_OF_GNM* = 0x00000008
  GDAL_OF_KIND_MASK* = 0x00000001
  GDAL_OF_SHARED* = 0x00000020
  GDAL_OF_VERBOSE_ERROR* = 0x00000040
  GDAL_OF_INTERNAL* = 0x00000080
  GDAL_OF_DEFAULT_BLOCK_ACCESS* = 0
  GDAL_OF_ARRAY_BLOCK_ACCESS* = 0x00000100
  GDAL_OF_HASHSET_BLOCK_ACCESS* = 0x00000200
  GDAL_OF_RESERVED_1* = 0x00000300
  GDAL_OF_BLOCK_ACCESS_MASK* = 0x00000300
  GMF_ALL_VALID* = 0x00000001
  GMF_PER_DATASET* = 0x00000002
  GMF_ALPHA* = 0x00000004
  GMF_NODATA* = 0x00000008
  GDAL_DATA_COVERAGE_STATUS_UNIMPLEMENTED* = 0x00000001
  GDAL_DATA_COVERAGE_STATUS_DATA* = 0x00000002
  GDAL_DATA_COVERAGE_STATUS_EMPTY* = 0x00000004

type
  GDALDataType* {.size: sizeof(cint).} = enum
    GDT_Unknown = 0, GDT_Byte = 1, GDT_UInt16 = 2, GDT_Int16 = 3, GDT_UInt32 = 4,
    GDT_Int32 = 5, GDT_Float32 = 6, GDT_Float64 = 7, GDT_CInt16 = 8, GDT_CInt32 = 9,
    GDT_CFloat32 = 10, GDT_CFloat64 = 11, GDT_TypeCount = 12


proc getDataTypeSize*(a1: GDALDataType): cint {.stdcall,
    importc: "GDALGetDataTypeSize", dynlib: dynlibgdal.}
proc getDataTypeSizeBits*(eDataType: GDALDataType): cint {.stdcall,
    importc: "GDALGetDataTypeSizeBits", dynlib: dynlibgdal.}
proc getDataTypeSizeBytes*(a1: GDALDataType): cint {.stdcall,
    importc: "GDALGetDataTypeSizeBytes", dynlib: dynlibgdal.}
proc dataTypeIsComplex*(a1: GDALDataType): cint {.stdcall,
    importc: "GDALDataTypeIsComplex", dynlib: dynlibgdal.}
proc getDataTypeName*(a1: GDALDataType): cstring {.stdcall,
    importc: "GDALGetDataTypeName", dynlib: dynlibgdal.}
proc getDataTypeByName*(a1: cstring): GDALDataType {.stdcall,
    importc: "GDALGetDataTypeByName", dynlib: dynlibgdal.}
proc dataTypeUnion*(a1: GDALDataType; a2: GDALDataType): GDALDataType {.stdcall,
    importc: "GDALDataTypeUnion", dynlib: dynlibgdal.}
proc adjustValueToDataType*(eDT: GDALDataType; dfValue: cdouble;
                               pbClamped: ptr cint; pbRounded: ptr cint): cdouble {.
    stdcall, importc: "GDALAdjustValueToDataType", dynlib: dynlibgdal.}
proc getNonComplexDataType*(a1: GDALDataType): GDALDataType {.stdcall,
    importc: "GDALGetNonComplexDataType", dynlib: dynlibgdal.}
type
  GDALAsyncStatusType* {.size: sizeof(cint).} = enum
    GARIO_PENDING = 0, GARIO_UPDATE = 1, GARIO_ERROR = 2, GARIO_COMPLETE = 3,
    GARIO_TypeCount = 4


proc getAsyncStatusTypeName*(a1: GDALAsyncStatusType): cstring {.stdcall,
    importc: "GDALGetAsyncStatusTypeName", dynlib: dynlibgdal.}
proc getAsyncStatusTypeByName*(a1: cstring): GDALAsyncStatusType {.stdcall,
    importc: "GDALGetAsyncStatusTypeByName", dynlib: dynlibgdal.}
type
  GDALAccess* {.size: sizeof(cint).} = enum
    GA_ReadOnly = 0, GA_Update = 1
  GDALRWFlag* {.size: sizeof(cint).} = enum
    GF_Read = 0, GF_Write = 1
  GDALRIOResampleAlg* {.size: sizeof(cint).} = enum
    GRIORA_NearestNeighbour = 0, GRIORA_Bilinear = 1, GRIORA_Cubic = 2,
    GRIORA_CubicSpline = 3, GRIORA_Lanczos = 4, GRIORA_Average = 5, GRIORA_Mode = 6,
    GRIORA_Gauss = 7
  GDALRasterIOExtraArg* {.bycopy.} = object
    nVersion*: cint
    eResampleAlg*: GDALRIOResampleAlg
    pfnProgress*: GDALProgressFunc
    pProgressData*: pointer
    bFloatingPointWindowValidity*: cint
    dfXOff*: cdouble
    dfYOff*: cdouble
    dfXSize*: cdouble
    dfYSize*: cdouble

  GDALColorInterp* {.size: sizeof(cint).} = enum
    GCI_Undefined = 0, GCI_GrayIndex = 1, GCI_PaletteIndex = 2, GCI_RedBand = 3,
    GCI_GreenBand = 4, GCI_BlueBand = 5, GCI_AlphaBand = 6, GCI_HueBand = 7,
    GCI_SaturationBand = 8, GCI_LightnessBand = 9, GCI_CyanBand = 10,
    GCI_MagentaBand = 11, GCI_YellowBand = 12, GCI_BlackBand = 13, GCI_YCbCr_YBand = 14,
    GCI_YCbCr_CbBand = 15, GCI_YCbCr_CrBand = 16




#const
#  GCI_Max = GCI_YCbCr_CrBand

proc getColorInterpretationName*(a1: GDALColorInterp): cstring {.stdcall,
    importc: "GDALGetColorInterpretationName", dynlib: dynlibgdal.}
proc getColorInterpretationByName*(pszName: cstring): GDALColorInterp {.stdcall,
    importc: "GDALGetColorInterpretationByName", dynlib: dynlibgdal.}
type
  GDALPaletteInterp* {.size: sizeof(cint).} = enum
    GPI_Gray = 0, GPI_RGB = 1, GPI_CMYK = 2, GPI_HLS = 3


proc getPaletteInterpretationName*(a1: GDALPaletteInterp): cstring {.stdcall,
    importc: "GDALGetPaletteInterpretationName", dynlib: dynlibgdal.}
type
  GDALMajorObjectH* = pointer
  GDALDatasetH* = pointer
  GDALRasterBandH* = pointer
  GDALDriverH* = pointer
  GDALColorTableH* = pointer
  GDALRasterAttributeTableH* = pointer
  GDALAsyncReaderH* = pointer
  GSpacing* = GIntBig

proc allRegister*() {.stdcall, importc: "GDALAllRegister", dynlib: dynlibgdal.}
proc create*(hDriver: GDALDriverH; a2: cstring; a3: cint; a4: cint; a5: cint;
                a6: GDALDataType; a7: cstringArray): GDALDatasetH {.stdcall,
    importc: "GDALCreate", dynlib: dynlibgdal.}
proc createCopy*(a1: GDALDriverH; a2: cstring; a3: GDALDatasetH; a4: cint;
                    a5: cstringArray; a6: GDALProgressFunc; a7: pointer): GDALDatasetH {.
    stdcall, importc: "GDALCreateCopy", dynlib: dynlibgdal.}
proc identifyDriver*(pszFilename: cstring; papszFileList: cstringArray): GDALDriverH {.
    stdcall, importc: "GDALIdentifyDriver", dynlib: dynlibgdal.}
proc identifyDriverEx*(pszFilename: cstring; nIdentifyFlags: cuint;
                          papszAllowedDrivers: cstringArray;
                          papszFileList: cstringArray): GDALDriverH {.stdcall,
    importc: "GDALIdentifyDriverEx", dynlib: dynlibgdal.}
proc open*(pszFilename: cstring; eAccess: GDALAccess): GDALDatasetH {.stdcall,
    importc: "GDALOpen", dynlib: dynlibgdal.}
proc openShared*(a1: cstring; a2: GDALAccess): GDALDatasetH {.stdcall,
    importc: "GDALOpenShared", dynlib: dynlibgdal.}
proc openEx*(pszFilename: cstring; nOpenFlags: cuint;
                papszAllowedDrivers: cstringArray; papszOpenOptions: cstringArray;
                papszSiblingFiles: cstringArray): GDALDatasetH {.stdcall,
    importc: "GDALOpenEx", dynlib: dynlibgdal.}
proc dumpOpenDatasets*(a1: ptr FILE): cint {.stdcall,
    importc: "GDALDumpOpenDatasets", dynlib: dynlibgdal.}
proc getDriverByName*(a1: cstring): GDALDriverH {.stdcall,
    importc: "GDALGetDriverByName", dynlib: dynlibgdal.}
proc getDriverCount*(): cint {.stdcall, importc: "GDALGetDriverCount",
                                dynlib: dynlibgdal.}
proc getDriver*(a1: cint): GDALDriverH {.stdcall, importc: "GDALGetDriver",
    dynlib: dynlibgdal.}
proc createDriver*(): GDALDriverH {.stdcall, importc: "GDALCreateDriver",
                                     dynlib: dynlibgdal.}
proc destroyDriver*(a1: GDALDriverH) {.stdcall, importc: "GDALDestroyDriver",
                                        dynlib: dynlibgdal.}
proc registerDriver*(a1: GDALDriverH): cint {.stdcall,
    importc: "GDALRegisterDriver", dynlib: dynlibgdal.}
proc deregisterDriver*(a1: GDALDriverH) {.stdcall,
    importc: "GDALDeregisterDriver", dynlib: dynlibgdal.}
proc destroyDriverManager*() {.stdcall, importc: "GDALDestroyDriverManager",
                                 dynlib: dynlibgdal.}
proc destroy*() {.stdcall, importc: "GDALDestroy", dynlib: dynlibgdal.}
proc deleteDataset*(a1: GDALDriverH; a2: cstring): CPLErr {.stdcall,
    importc: "GDALDeleteDataset", dynlib: dynlibgdal.}
proc renameDataset*(a1: GDALDriverH; pszNewName: cstring; pszOldName: cstring): CPLErr {.
    stdcall, importc: "GDALRenameDataset", dynlib: dynlibgdal.}
proc copyDatasetFiles*(a1: GDALDriverH; pszNewName: cstring; pszOldName: cstring): CPLErr {.
    stdcall, importc: "GDALCopyDatasetFiles", dynlib: dynlibgdal.}
proc validateCreationOptions*(a1: GDALDriverH;
                                 papszCreationOptions: cstringArray): cint {.
    stdcall, importc: "GDALValidateCreationOptions", dynlib: dynlibgdal.}
proc getDriverShortName*(a1: GDALDriverH): cstring {.stdcall,
    importc: "GDALGetDriverShortName", dynlib: dynlibgdal.}
proc getDriverLongName*(a1: GDALDriverH): cstring {.stdcall,
    importc: "GDALGetDriverLongName", dynlib: dynlibgdal.}
proc getDriverHelpTopic*(a1: GDALDriverH): cstring {.stdcall,
    importc: "GDALGetDriverHelpTopic", dynlib: dynlibgdal.}
proc getDriverCreationOptionList*(a1: GDALDriverH): cstring {.stdcall,
    importc: "GDALGetDriverCreationOptionList", dynlib: dynlibgdal.}
type
  GDAL_GCP* {.bycopy.} = object
    pszId*: cstring
    pszInfo*: cstring
    dfGCPPixel*: cdouble
    dfGCPLine*: cdouble
    dfGCPX*: cdouble
    dfGCPY*: cdouble
    dfGCPZ*: cdouble


proc initGCPs*(a1: cint; a2: ptr GDAL_GCP) {.stdcall, importc: "GDALInitGCPs",
    dynlib: dynlibgdal.}
proc deinitGCPs*(a1: cint; a2: ptr GDAL_GCP) {.stdcall, importc: "GDALDeinitGCPs",
    dynlib: dynlibgdal.}
proc duplicateGCPs*(a1: cint; a2: ptr GDAL_GCP): ptr GDAL_GCP {.stdcall,
    importc: "GDALDuplicateGCPs", dynlib: dynlibgdal.}
proc gCPsToGeoTransform*(nGCPCount: cint; pasGCPs: ptr GDAL_GCP;
                            padfGeoTransform: ptr cdouble; bApproxOK: cint): cint {.
    stdcall, importc: "GDALGCPsToGeoTransform", dynlib: dynlibgdal.}
proc invGeoTransform*(padfGeoTransformIn: ptr cdouble;
                         padfInvGeoTransformOut: ptr cdouble): cint {.stdcall,
    importc: "GDALInvGeoTransform", dynlib: dynlibgdal.}
proc applyGeoTransform*(a1: ptr cdouble; a2: cdouble; a3: cdouble; a4: ptr cdouble;
                           a5: ptr cdouble) {.stdcall,
    importc: "GDALApplyGeoTransform", dynlib: dynlibgdal.}
proc composeGeoTransforms*(padfGeoTransform1: ptr cdouble;
                              padfGeoTransform2: ptr cdouble;
                              padfGeoTransformOut: ptr cdouble) {.stdcall,
    importc: "GDALComposeGeoTransforms", dynlib: dynlibgdal.}
proc getMetadataDomainList*(hObject: GDALMajorObjectH): cstringArray {.stdcall,
    importc: "GDALGetMetadataDomainList", dynlib: dynlibgdal.}
proc getMetadata*(a1: GDALMajorObjectH; a2: cstring): cstringArray {.stdcall,
    importc: "GDALGetMetadata", dynlib: dynlibgdal.}
proc setMetadata*(a1: GDALMajorObjectH; a2: cstringArray; a3: cstring): CPLErr {.
    stdcall, importc: "GDALSetMetadata", dynlib: dynlibgdal.}
proc getMetadataItem*(a1: GDALMajorObjectH; a2: cstring; a3: cstring): cstring {.
    stdcall, importc: "GDALGetMetadataItem", dynlib: dynlibgdal.}
proc setMetadataItem*(a1: GDALMajorObjectH; a2: cstring; a3: cstring; a4: cstring): CPLErr {.
    stdcall, importc: "GDALSetMetadataItem", dynlib: dynlibgdal.}
proc getDescription*(a1: GDALMajorObjectH): cstring {.stdcall,
    importc: "GDALGetDescription", dynlib: dynlibgdal.}
proc setDescription*(a1: GDALMajorObjectH; a2: cstring) {.stdcall,
    importc: "GDALSetDescription", dynlib: dynlibgdal.}
proc getDatasetDriver*(a1: GDALDatasetH): GDALDriverH {.stdcall,
    importc: "GDALGetDatasetDriver", dynlib: dynlibgdal.}
proc getFileList*(a1: GDALDatasetH): cstringArray {.stdcall,
    importc: "GDALGetFileList", dynlib: dynlibgdal.}
proc close*(a1: GDALDatasetH) {.stdcall, importc: "GDALClose", dynlib: dynlibgdal.}
proc getRasterXSize*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALGetRasterXSize", dynlib: dynlibgdal.}
proc getRasterYSize*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALGetRasterYSize", dynlib: dynlibgdal.}
proc getRasterCount*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALGetRasterCount", dynlib: dynlibgdal.}
proc getRasterBand*(a1: GDALDatasetH; a2: cint): GDALRasterBandH {.stdcall,
    importc: "GDALGetRasterBand", dynlib: dynlibgdal.}
proc addBand*(hDS: GDALDatasetH; eType: GDALDataType; papszOptions: cstringArray): CPLErr {.
    stdcall, importc: "GDALAddBand", dynlib: dynlibgdal.}
proc beginAsyncReader*(hDS: GDALDatasetH; nXOff: cint; nYOff: cint; nXSize: cint;
                          nYSize: cint; pBuf: pointer; nBufXSize: cint;
                          nBufYSize: cint; eBufType: GDALDataType; nBandCount: cint;
                          panBandMap: ptr cint; nPixelSpace: cint; nLineSpace: cint;
                          nBandSpace: cint; papszOptions: cstringArray): GDALAsyncReaderH {.
    stdcall, importc: "GDALBeginAsyncReader", dynlib: dynlibgdal.}
proc endAsyncReader*(hDS: GDALDatasetH; hAsynchReaderH: GDALAsyncReaderH) {.
    stdcall, importc: "GDALEndAsyncReader", dynlib: dynlibgdal.}
proc rasterIO*(hDS: GDALDatasetH; eRWFlag: GDALRWFlag; nDSXOff: cint;
                         nDSYOff: cint; nDSXSize: cint; nDSYSize: cint;
                         pBuffer: pointer; nBXSize: cint; nBYSize: cint;
                         eBDataType: GDALDataType; nBandCount: cint;
                         panBandCount: ptr cint; nPixelSpace: cint; nLineSpace: cint;
                         nBandSpace: cint): CPLErr {.stdcall,
    importc: "GDALDatasetRasterIO", dynlib: dynlibgdal.}
proc rasterIOEx*(hDS: GDALDatasetH; eRWFlag: GDALRWFlag; nDSXOff: cint;
                           nDSYOff: cint; nDSXSize: cint; nDSYSize: cint;
                           pBuffer: pointer; nBXSize: cint; nBYSize: cint;
                           eBDataType: GDALDataType; nBandCount: cint;
                           panBandCount: ptr cint; nPixelSpace: GSpacing;
                           nLineSpace: GSpacing; nBandSpace: GSpacing;
                           psExtraArg: ptr GDALRasterIOExtraArg): CPLErr {.stdcall,
    importc: "GDALDatasetRasterIOEx", dynlib: dynlibgdal.}
proc adviseRead*(hDS: GDALDatasetH; nDSXOff: cint; nDSYOff: cint;
                           nDSXSize: cint; nDSYSize: cint; nBXSize: cint;
                           nBYSize: cint; eBDataType: GDALDataType;
                           nBandCount: cint; panBandCount: ptr cint;
                           papszOptions: cstringArray): CPLErr {.stdcall,
    importc: "GDALDatasetAdviseRead", dynlib: dynlibgdal.}
proc getProjectionRef*(a1: GDALDatasetH): cstring {.stdcall,
    importc: "GDALGetProjectionRef", dynlib: dynlibgdal.}
proc setProjection*(a1: GDALDatasetH; a2: cstring): CPLErr {.stdcall,
    importc: "GDALSetProjection", dynlib: dynlibgdal.}
proc getGeoTransform*(a1: GDALDatasetH; a2: ptr cdouble): CPLErr {.stdcall,
    importc: "GDALGetGeoTransform", dynlib: dynlibgdal.}
proc setGeoTransform*(a1: GDALDatasetH; a2: ptr cdouble): CPLErr {.stdcall,
    importc: "GDALSetGeoTransform", dynlib: dynlibgdal.}
proc getGCPCount*(a1: GDALDatasetH): cint {.stdcall, importc: "GDALGetGCPCount",
    dynlib: dynlibgdal.}
proc getGCPProjection*(a1: GDALDatasetH): cstring {.stdcall,
    importc: "GDALGetGCPProjection", dynlib: dynlibgdal.}
proc getGCPs*(a1: GDALDatasetH): ptr GDAL_GCP {.stdcall, importc: "GDALGetGCPs",
    dynlib: dynlibgdal.}
proc setGCPs*(a1: GDALDatasetH; a2: cint; a3: ptr GDAL_GCP; a4: cstring): CPLErr {.
    stdcall, importc: "GDALSetGCPs", dynlib: dynlibgdal.}
proc getInternalHandle*(a1: GDALDatasetH; a2: cstring): pointer {.stdcall,
    importc: "GDALGetInternalHandle", dynlib: dynlibgdal.}
proc referenceDataset*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALReferenceDataset", dynlib: dynlibgdal.}
proc dereferenceDataset*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALDereferenceDataset", dynlib: dynlibgdal.}
proc releaseDataset*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALReleaseDataset", dynlib: dynlibgdal.}
proc buildOverviews*(a1: GDALDatasetH; a2: cstring; a3: cint; a4: ptr cint; a5: cint;
                        a6: ptr cint; a7: GDALProgressFunc; a8: pointer): CPLErr {.
    stdcall, importc: "GDALBuildOverviews", dynlib: dynlibgdal.}
proc getOpenDatasets*(hDS: ptr ptr GDALDatasetH; pnCount: ptr cint) {.stdcall,
    importc: "GDALGetOpenDatasets", dynlib: dynlibgdal.}
proc getAccess*(hDS: GDALDatasetH): cint {.stdcall, importc: "GDALGetAccess",
    dynlib: dynlibgdal.}
proc flushCache*(hDS: GDALDatasetH) {.stdcall, importc: "GDALFlushCache",
                                       dynlib: dynlibgdal.}
proc createDatasetMaskBand*(hDS: GDALDatasetH; nFlags: cint): CPLErr {.stdcall,
    importc: "GDALCreateDatasetMaskBand", dynlib: dynlibgdal.}
proc copyWholeRaster*(hSrcDS: GDALDatasetH; hDstDS: GDALDatasetH;
                                papszOptions: cstringArray;
                                pfnProgress: GDALProgressFunc;
                                pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALDatasetCopyWholeRaster", dynlib: dynlibgdal.}
proc rasterBandCopyWholeRaster*(hSrcBand: GDALRasterBandH;
                                   hDstBand: GDALRasterBandH;
                                   constpapszOptions: cstringArray;
                                   pfnProgress: GDALProgressFunc;
                                   pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALRasterBandCopyWholeRaster", dynlib: dynlibgdal.}
proc regenerateOverviews*(hSrcBand: GDALRasterBandH; nOverviewCount: cint;
                             pahOverviewBands: ptr GDALRasterBandH;
                             pszResampling: cstring;
                             pfnProgress: GDALProgressFunc; pProgressData: pointer): CPLErr {.
    stdcall, importc: "GDALRegenerateOverviews", dynlib: dynlibgdal.}
proc getLayerCount*(a1: GDALDatasetH): cint {.stdcall,
    importc: "GDALDatasetGetLayerCount", dynlib: dynlibgdal.}
proc getLayer*(a1: GDALDatasetH; a2: cint): OGRLayerH {.stdcall,
    importc: "GDALDatasetGetLayer", dynlib: dynlibgdal.}
proc getLayerByName*(a1: GDALDatasetH; a2: cstring): OGRLayerH {.stdcall,
    importc: "GDALDatasetGetLayerByName", dynlib: dynlibgdal.}
proc deleteLayer*(a1: GDALDatasetH; a2: cint): OGRErr {.stdcall,
    importc: "GDALDatasetDeleteLayer", dynlib: dynlibgdal.}
proc createLayer*(a1: GDALDatasetH; a2: cstring; a3: OGRSpatialReferenceH;
                            a4: OGRwkbGeometryType; a5: cstringArray): OGRLayerH {.
    stdcall, importc: "GDALDatasetCreateLayer", dynlib: dynlibgdal.}
proc copyLayer*(a1: GDALDatasetH; a2: OGRLayerH; a3: cstring;
                          a4: cstringArray): OGRLayerH {.stdcall,
    importc: "GDALDatasetCopyLayer", dynlib: dynlibgdal.}
proc resetReading*(a1: GDALDatasetH) {.stdcall,
    importc: "GDALDatasetResetReading", dynlib: dynlibgdal.}
proc getNextFeature*(hDS: GDALDatasetH; phBelongingLayer: ptr OGRLayerH;
                               pdfProgressPct: ptr cdouble;
                               pfnProgress: GDALProgressFunc;
                               pProgressData: pointer): OGRFeatureH {.stdcall,
    importc: "GDALDatasetGetNextFeature", dynlib: dynlibgdal.}
proc testCapability*(a1: GDALDatasetH; a2: cstring): cint {.stdcall,
    importc: "GDALDatasetTestCapability", dynlib: dynlibgdal.}
proc executeSQL*(a1: GDALDatasetH; a2: cstring; a3: OGRGeometryH;
                           a4: cstring): OGRLayerH {.stdcall,
    importc: "GDALDatasetExecuteSQL", dynlib: dynlibgdal.}
proc releaseResultSet*(a1: GDALDatasetH; a2: OGRLayerH) {.stdcall,
    importc: "GDALDatasetReleaseResultSet", dynlib: dynlibgdal.}
proc getStyleTable*(a1: GDALDatasetH): OGRStyleTableH {.stdcall,
    importc: "GDALDatasetGetStyleTable", dynlib: dynlibgdal.}
proc setStyleTableDirectly*(a1: GDALDatasetH; a2: OGRStyleTableH) {.
    stdcall, importc: "GDALDatasetSetStyleTableDirectly", dynlib: dynlibgdal.}
proc setStyleTable*(a1: GDALDatasetH; a2: OGRStyleTableH) {.stdcall,
    importc: "GDALDatasetSetStyleTable", dynlib: dynlibgdal.}
proc startTransaction*(hDS: GDALDatasetH; bForce: cint): OGRErr {.stdcall,
    importc: "GDALDatasetStartTransaction", dynlib: dynlibgdal.}
proc commitTransaction*(hDS: GDALDatasetH): OGRErr {.stdcall,
    importc: "GDALDatasetCommitTransaction", dynlib: dynlibgdal.}
proc rollbackTransaction*(hDS: GDALDatasetH): OGRErr {.stdcall,
    importc: "GDALDatasetRollbackTransaction", dynlib: dynlibgdal.}
type
  GDALDerivedPixelFunc* = proc (papoSources: ptr pointer; nSources: cint;
                             pData: pointer; nBufXSize: cint; nBufYSize: cint;
                             eSrcType: GDALDataType; eBufType: GDALDataType;
                             nPixelSpace: cint; nLineSpace: cint): CPLErr {.stdcall.}

proc getRasterDataType*(a1: GDALRasterBandH): GDALDataType {.stdcall,
    importc: "GDALGetRasterDataType", dynlib: dynlibgdal.}
proc getBlockSize*(a1: GDALRasterBandH; pnXSize: ptr cint; pnYSize: ptr cint) {.
    stdcall, importc: "GDALGetBlockSize", dynlib: dynlibgdal.}
proc getActualBlockSize*(a1: GDALRasterBandH; nXBlockOff: cint; nYBlockOff: cint;
                            pnXValid: ptr cint; pnYValid: ptr cint): CPLErr {.stdcall,
    importc: "GDALGetActualBlockSize", dynlib: dynlibgdal.}
proc rasterAdviseRead*(hRB: GDALRasterBandH; nDSXOff: cint; nDSYOff: cint;
                          nDSXSize: cint; nDSYSize: cint; nBXSize: cint;
                          nBYSize: cint; eBDataType: GDALDataType;
                          papszOptions: cstringArray): CPLErr {.stdcall,
    importc: "GDALRasterAdviseRead", dynlib: dynlibgdal.}
proc rasterIO*(hRBand: GDALRasterBandH; eRWFlag: GDALRWFlag; nDSXOff: cint;
                  nDSYOff: cint; nDSXSize: cint; nDSYSize: cint; pBuffer: pointer;
                  nBXSize: cint; nBYSize: cint; eBDataType: GDALDataType;
                  nPixelSpace: cint; nLineSpace: cint): CPLErr {.stdcall,
    importc: "GDALRasterIO", dynlib: dynlibgdal.}
proc rasterIOEx*(hRBand: GDALRasterBandH; eRWFlag: GDALRWFlag; nDSXOff: cint;
                    nDSYOff: cint; nDSXSize: cint; nDSYSize: cint; pBuffer: pointer;
                    nBXSize: cint; nBYSize: cint; eBDataType: GDALDataType;
                    nPixelSpace: GSpacing; nLineSpace: GSpacing;
                    psExtraArg: ptr GDALRasterIOExtraArg): CPLErr {.stdcall,
    importc: "GDALRasterIOEx", dynlib: dynlibgdal.}
proc readBlock*(a1: GDALRasterBandH; a2: cint; a3: cint; a4: pointer): CPLErr {.
    stdcall, importc: "GDALReadBlock", dynlib: dynlibgdal.}
proc writeBlock*(a1: GDALRasterBandH; a2: cint; a3: cint; a4: pointer): CPLErr {.
    stdcall, importc: "GDALWriteBlock", dynlib: dynlibgdal.}
proc getRasterBandXSize*(a1: GDALRasterBandH): cint {.stdcall,
    importc: "GDALGetRasterBandXSize", dynlib: dynlibgdal.}
proc getRasterBandYSize*(a1: GDALRasterBandH): cint {.stdcall,
    importc: "GDALGetRasterBandYSize", dynlib: dynlibgdal.}
proc getRasterAccess*(a1: GDALRasterBandH): GDALAccess {.stdcall,
    importc: "GDALGetRasterAccess", dynlib: dynlibgdal.}
proc getBandNumber*(a1: GDALRasterBandH): cint {.stdcall,
    importc: "GDALGetBandNumber", dynlib: dynlibgdal.}
proc getBandDataset*(a1: GDALRasterBandH): GDALDatasetH {.stdcall,
    importc: "GDALGetBandDataset", dynlib: dynlibgdal.}
proc getRasterColorInterpretation*(a1: GDALRasterBandH): GDALColorInterp {.
    stdcall, importc: "GDALGetRasterColorInterpretation", dynlib: dynlibgdal.}
proc setRasterColorInterpretation*(a1: GDALRasterBandH; a2: GDALColorInterp): CPLErr {.
    stdcall, importc: "GDALSetRasterColorInterpretation", dynlib: dynlibgdal.}
proc getRasterColorTable*(a1: GDALRasterBandH): GDALColorTableH {.stdcall,
    importc: "GDALGetRasterColorTable", dynlib: dynlibgdal.}
proc setRasterColorTable*(a1: GDALRasterBandH; a2: GDALColorTableH): CPLErr {.
    stdcall, importc: "GDALSetRasterColorTable", dynlib: dynlibgdal.}
proc hasArbitraryOverviews*(a1: GDALRasterBandH): cint {.stdcall,
    importc: "GDALHasArbitraryOverviews", dynlib: dynlibgdal.}
proc getOverviewCount*(a1: GDALRasterBandH): cint {.stdcall,
    importc: "GDALGetOverviewCount", dynlib: dynlibgdal.}
proc getOverview*(a1: GDALRasterBandH; a2: cint): GDALRasterBandH {.stdcall,
    importc: "GDALGetOverview", dynlib: dynlibgdal.}
proc getRasterNoDataValue*(a1: GDALRasterBandH; a2: ptr cint): cdouble {.stdcall,
    importc: "GDALGetRasterNoDataValue", dynlib: dynlibgdal.}
proc setRasterNoDataValue*(a1: GDALRasterBandH; a2: cdouble): CPLErr {.stdcall,
    importc: "GDALSetRasterNoDataValue", dynlib: dynlibgdal.}
proc deleteRasterNoDataValue*(a1: GDALRasterBandH): CPLErr {.stdcall,
    importc: "GDALDeleteRasterNoDataValue", dynlib: dynlibgdal.}
proc getRasterCategoryNames*(a1: GDALRasterBandH): cstringArray {.stdcall,
    importc: "GDALGetRasterCategoryNames", dynlib: dynlibgdal.}
proc setRasterCategoryNames*(a1: GDALRasterBandH; a2: cstringArray): CPLErr {.
    stdcall, importc: "GDALSetRasterCategoryNames", dynlib: dynlibgdal.}
proc getRasterMinimum*(a1: GDALRasterBandH; pbSuccess: ptr cint): cdouble {.
    stdcall, importc: "GDALGetRasterMinimum", dynlib: dynlibgdal.}
proc getRasterMaximum*(a1: GDALRasterBandH; pbSuccess: ptr cint): cdouble {.
    stdcall, importc: "GDALGetRasterMaximum", dynlib: dynlibgdal.}
proc getRasterStatistics*(a1: GDALRasterBandH; bApproxOK: cint; bForce: cint;
                             pdfMin: ptr cdouble; pdfMax: ptr cdouble;
                             pdfMean: ptr cdouble; pdfStdDev: ptr cdouble): CPLErr {.
    stdcall, importc: "GDALGetRasterStatistics", dynlib: dynlibgdal.}
proc computeRasterStatistics*(a1: GDALRasterBandH; bApproxOK: cint;
                                 pdfMin: ptr cdouble; pdfMax: ptr cdouble;
                                 pdfMean: ptr cdouble; pdfStdDev: ptr cdouble;
                                 pfnProgress: GDALProgressFunc;
                                 pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALComputeRasterStatistics", dynlib: dynlibgdal.}
proc setRasterStatistics*(hBand: GDALRasterBandH; dfMin: cdouble; dfMax: cdouble;
                             dfMean: cdouble; dfStdDev: cdouble): CPLErr {.stdcall,
    importc: "GDALSetRasterStatistics", dynlib: dynlibgdal.}
proc getRasterUnitType*(a1: GDALRasterBandH): cstring {.stdcall,
    importc: "GDALGetRasterUnitType", dynlib: dynlibgdal.}
proc setRasterUnitType*(hBand: GDALRasterBandH; pszNewValue: cstring): CPLErr {.
    stdcall, importc: "GDALSetRasterUnitType", dynlib: dynlibgdal.}
proc getRasterOffset*(a1: GDALRasterBandH; pbSuccess: ptr cint): cdouble {.stdcall,
    importc: "GDALGetRasterOffset", dynlib: dynlibgdal.}
proc setRasterOffset*(hBand: GDALRasterBandH; dfNewOffset: cdouble): CPLErr {.
    stdcall, importc: "GDALSetRasterOffset", dynlib: dynlibgdal.}
proc getRasterScale*(a1: GDALRasterBandH; pbSuccess: ptr cint): cdouble {.stdcall,
    importc: "GDALGetRasterScale", dynlib: dynlibgdal.}
proc setRasterScale*(hBand: GDALRasterBandH; dfNewOffset: cdouble): CPLErr {.
    stdcall, importc: "GDALSetRasterScale", dynlib: dynlibgdal.}
proc computeRasterMinMax*(hBand: GDALRasterBandH; bApproxOK: cint;
                             adfMinMax: array[2, cdouble]) {.stdcall,
    importc: "GDALComputeRasterMinMax", dynlib: dynlibgdal.}
proc flushRasterCache*(hBand: GDALRasterBandH): CPLErr {.stdcall,
    importc: "GDALFlushRasterCache", dynlib: dynlibgdal.}
proc getRasterHistogram*(hBand: GDALRasterBandH; dfMin: cdouble; dfMax: cdouble;
                            nBuckets: cint; panHistogram: ptr cint;
                            bIncludeOutOfRange: cint; bApproxOK: cint;
                            pfnProgress: GDALProgressFunc; pProgressData: pointer): CPLErr {.
    stdcall, importc: "GDALGetRasterHistogram", dynlib: dynlibgdal.}
proc getRasterHistogramEx*(hBand: GDALRasterBandH; dfMin: cdouble;
                              dfMax: cdouble; nBuckets: cint;
                              panHistogram: ptr GUIntBig; bIncludeOutOfRange: cint;
                              bApproxOK: cint; pfnProgress: GDALProgressFunc;
                              pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALGetRasterHistogramEx", dynlib: dynlibgdal.}
proc getDefaultHistogram*(hBand: GDALRasterBandH; pdfMin: ptr cdouble;
                             pdfMax: ptr cdouble; pnBuckets: ptr cint;
                             ppanHistogram: ptr ptr cint; bForce: cint;
                             pfnProgress: GDALProgressFunc; pProgressData: pointer): CPLErr {.
    stdcall, importc: "GDALGetDefaultHistogram", dynlib: dynlibgdal.}
proc getDefaultHistogramEx*(hBand: GDALRasterBandH; pdfMin: ptr cdouble;
                               pdfMax: ptr cdouble; pnBuckets: ptr cint;
                               ppanHistogram: ptr ptr GUIntBig; bForce: cint;
                               pfnProgress: GDALProgressFunc;
                               pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALGetDefaultHistogramEx", dynlib: dynlibgdal.}
proc setDefaultHistogram*(hBand: GDALRasterBandH; dfMin: cdouble; dfMax: cdouble;
                             nBuckets: cint; panHistogram: ptr cint): CPLErr {.
    stdcall, importc: "GDALSetDefaultHistogram", dynlib: dynlibgdal.}
proc setDefaultHistogramEx*(hBand: GDALRasterBandH; dfMin: cdouble;
                               dfMax: cdouble; nBuckets: cint;
                               panHistogram: ptr GUIntBig): CPLErr {.stdcall,
    importc: "GDALSetDefaultHistogramEx", dynlib: dynlibgdal.}
proc getRandomRasterSample*(a1: GDALRasterBandH; a2: cint; a3: ptr cfloat): cint {.
    stdcall, importc: "GDALGetRandomRasterSample", dynlib: dynlibgdal.}
proc getRasterSampleOverview*(a1: GDALRasterBandH; a2: cint): GDALRasterBandH {.
    stdcall, importc: "GDALGetRasterSampleOverview", dynlib: dynlibgdal.}
proc getRasterSampleOverviewEx*(a1: GDALRasterBandH; a2: GUIntBig): GDALRasterBandH {.
    stdcall, importc: "GDALGetRasterSampleOverviewEx", dynlib: dynlibgdal.}
proc fillRaster*(hBand: GDALRasterBandH; dfRealValue: cdouble;
                    dfImaginaryValue: cdouble): CPLErr {.stdcall,
    importc: "GDALFillRaster", dynlib: dynlibgdal.}
proc computeBandStats*(hBand: GDALRasterBandH; nSampleStep: cint;
                          pdfMean: ptr cdouble; pdfStdDev: ptr cdouble;
                          pfnProgress: GDALProgressFunc; pProgressData: pointer): CPLErr {.
    stdcall, importc: "GDALComputeBandStats", dynlib: dynlibgdal.}
proc overviewMagnitudeCorrection*(hBaseBand: GDALRasterBandH;
                                     nOverviewCount: cint;
                                     pahOverviews: ptr GDALRasterBandH;
                                     pfnProgress: GDALProgressFunc;
                                     pProgressData: pointer): CPLErr {.stdcall,
    importc: "GDALOverviewMagnitudeCorrection", dynlib: dynlibgdal.}
proc getDefaultRAT*(hBand: GDALRasterBandH): GDALRasterAttributeTableH {.
    stdcall, importc: "GDALGetDefaultRAT", dynlib: dynlibgdal.}
proc setDefaultRAT*(a1: GDALRasterBandH; a2: GDALRasterAttributeTableH): CPLErr {.
    stdcall, importc: "GDALSetDefaultRAT", dynlib: dynlibgdal.}
proc addDerivedBandPixelFunc*(pszName: cstring;
                                 pfnPixelFunc: GDALDerivedPixelFunc): CPLErr {.
    stdcall, importc: "GDALAddDerivedBandPixelFunc", dynlib: dynlibgdal.}
proc getMaskBand*(hBand: GDALRasterBandH): GDALRasterBandH {.stdcall,
    importc: "GDALGetMaskBand", dynlib: dynlibgdal.}
proc getMaskFlags*(hBand: GDALRasterBandH): cint {.stdcall,
    importc: "GDALGetMaskFlags", dynlib: dynlibgdal.}
proc createMaskBand*(hBand: GDALRasterBandH; nFlags: cint): CPLErr {.stdcall,
    importc: "GDALCreateMaskBand", dynlib: dynlibgdal.}
proc getDataCoverageStatus*(hBand: GDALRasterBandH; nXOff: cint; nYOff: cint;
                               nXSize: cint; nYSize: cint; nMaskFlagStop: cint;
                               pdfDataPct: ptr cdouble): cint {.stdcall,
    importc: "GDALGetDataCoverageStatus", dynlib: dynlibgdal.}
proc aRGetNextUpdatedRegion*(hARIO: GDALAsyncReaderH; dfTimeout: cdouble;
                                pnXBufOff: ptr cint; pnYBufOff: ptr cint;
                                pnXBufSize: ptr cint; pnYBufSize: ptr cint): GDALAsyncStatusType {.
    stdcall, importc: "GDALARGetNextUpdatedRegion", dynlib: dynlibgdal.}
proc aRLockBuffer*(hARIO: GDALAsyncReaderH; dfTimeout: cdouble): cint {.stdcall,
    importc: "GDALARLockBuffer", dynlib: dynlibgdal.}
proc aRUnlockBuffer*(hARIO: GDALAsyncReaderH) {.stdcall,
    importc: "GDALARUnlockBuffer", dynlib: dynlibgdal.}
proc generalCmdLineProcessor*(nArgc: cint; ppapszArgv: ptr cstringArray;
                                 nOptions: cint): cint {.stdcall,
    importc: "GDALGeneralCmdLineProcessor", dynlib: dynlibgdal.}
proc swapWords*(pData: pointer; nWordSize: cint; nWordCount: cint; nWordSkip: cint) {.
    stdcall, importc: "GDALSwapWords", dynlib: dynlibgdal.}
proc swapWordsEx*(pData: pointer; nWordSize: cint; nWordCount: csize;
                     nWordSkip: cint) {.stdcall, importc: "GDALSwapWordsEx",
                                      dynlib: dynlibgdal.}
proc copyBits*(pabySrcData: ptr GByte; nSrcOffset: cint; nSrcStep: cint;
                  pabyDstData: ptr GByte; nDstOffset: cint; nDstStep: cint;
                  nBitCount: cint; nStepCount: cint) {.stdcall,
    importc: "GDALCopyBits", dynlib: dynlibgdal.}
proc loadWorldFile*(a1: cstring; a2: ptr cdouble): cint {.stdcall,
    importc: "GDALLoadWorldFile", dynlib: dynlibgdal.}
proc readWorldFile*(a1: cstring; a2: cstring; a3: ptr cdouble): cint {.stdcall,
    importc: "GDALReadWorldFile", dynlib: dynlibgdal.}
proc writeWorldFile*(a1: cstring; a2: cstring; a3: ptr cdouble): cint {.stdcall,
    importc: "GDALWriteWorldFile", dynlib: dynlibgdal.}
proc loadTabFile*(a1: cstring; a2: ptr cdouble; a3: cstringArray; a4: ptr cint;
                     a5: ptr ptr GDAL_GCP): cint {.stdcall,
    importc: "GDALLoadTabFile", dynlib: dynlibgdal.}
proc readTabFile*(a1: cstring; a2: ptr cdouble; a3: cstringArray; a4: ptr cint;
                     a5: ptr ptr GDAL_GCP): cint {.stdcall,
    importc: "GDALReadTabFile", dynlib: dynlibgdal.}
proc loadOziMapFile*(a1: cstring; a2: ptr cdouble; a3: cstringArray; a4: ptr cint;
                        a5: ptr ptr GDAL_GCP): cint {.stdcall,
    importc: "GDALLoadOziMapFile", dynlib: dynlibgdal.}
proc readOziMapFile*(a1: cstring; a2: ptr cdouble; a3: cstringArray; a4: ptr cint;
                        a5: ptr ptr GDAL_GCP): cint {.stdcall,
    importc: "GDALReadOziMapFile", dynlib: dynlibgdal.}
proc decToDMS*(a1: cdouble; a2: cstring; a3: cint): cstring {.stdcall,
    importc: "GDALDecToDMS", dynlib: dynlibgdal.}
proc packedDMSToDec*(a1: cdouble): cdouble {.stdcall,
    importc: "GDALPackedDMSToDec", dynlib: dynlibgdal.}
proc decToPackedDMS*(a1: cdouble): cdouble {.stdcall,
    importc: "GDALDecToPackedDMS", dynlib: dynlibgdal.}
type
  GDALRPCInfo* {.bycopy.} = object
    dfLINE_OFF*: cdouble
    dfSAMP_OFF*: cdouble
    dfLAT_OFF*: cdouble
    dfLONG_OFF*: cdouble
    dfHEIGHT_OFF*: cdouble
    dfLINE_SCALE*: cdouble
    dfSAMP_SCALE*: cdouble
    dfLAT_SCALE*: cdouble
    dfLONG_SCALE*: cdouble
    dfHEIGHT_SCALE*: cdouble
    adfLINE_NUM_COEFF*: array[20, cdouble]
    adfLINE_DEN_COEFF*: array[20, cdouble]
    adfSAMP_NUM_COEFF*: array[20, cdouble]
    adfSAMP_DEN_COEFF*: array[20, cdouble]
    dfMIN_LONG*: cdouble
    dfMIN_LAT*: cdouble
    dfMAX_LONG*: cdouble
    dfMAX_LAT*: cdouble


proc extractRPCInfo*(a1: cstringArray; a2: ptr GDALRPCInfo): cint {.stdcall,
    importc: "GDALExtractRPCInfo", dynlib: dynlibgdal.}
type
  GDALColorEntry* {.bycopy.} = object
    c1*: cshort
    c2*: cshort
    c3*: cshort
    c4*: cshort


proc createColorTable*(a1: GDALPaletteInterp): GDALColorTableH {.stdcall,
    importc: "GDALCreateColorTable", dynlib: dynlibgdal.}
proc destroyColorTable*(a1: GDALColorTableH) {.stdcall,
    importc: "GDALDestroyColorTable", dynlib: dynlibgdal.}
proc cloneColorTable*(a1: GDALColorTableH): GDALColorTableH {.stdcall,
    importc: "GDALCloneColorTable", dynlib: dynlibgdal.}
proc getPaletteInterpretation*(a1: GDALColorTableH): GDALPaletteInterp {.
    stdcall, importc: "GDALGetPaletteInterpretation", dynlib: dynlibgdal.}
proc getColorEntryCount*(a1: GDALColorTableH): cint {.stdcall,
    importc: "GDALGetColorEntryCount", dynlib: dynlibgdal.}
proc getColorEntry*(a1: GDALColorTableH; a2: cint): ptr GDALColorEntry {.stdcall,
    importc: "GDALGetColorEntry", dynlib: dynlibgdal.}
proc getColorEntryAsRGB*(a1: GDALColorTableH; a2: cint; a3: ptr GDALColorEntry): cint {.
    stdcall, importc: "GDALGetColorEntryAsRGB", dynlib: dynlibgdal.}
proc setColorEntry*(a1: GDALColorTableH; a2: cint; a3: ptr GDALColorEntry) {.
    stdcall, importc: "GDALSetColorEntry", dynlib: dynlibgdal.}
proc createColorRamp*(hTable: GDALColorTableH; nStartIndex: cint;
                         psStartColor: ptr GDALColorEntry; nEndIndex: cint;
                         psEndColor: ptr GDALColorEntry) {.stdcall,
    importc: "GDALCreateColorRamp", dynlib: dynlibgdal.}
type
  GDALRATFieldType* {.size: sizeof(cint).} = enum
    GFT_Integer, GFT_Real, GFT_String
  GDALRATFieldUsage* {.size: sizeof(cint).} = enum
    GFU_Generic = 0, GFU_PixelCount = 1, GFU_Name = 2, GFU_Min = 3, GFU_Max = 4,
    GFU_MinMax = 5, GFU_Red = 6, GFU_Green = 7, GFU_Blue = 8, GFU_Alpha = 9, GFU_RedMin = 10,
    GFU_GreenMin = 11, GFU_BlueMin = 12, GFU_AlphaMin = 13, GFU_RedMax = 14,
    GFU_GreenMax = 15, GFU_BlueMax = 16, GFU_AlphaMax = 17, GFU_MaxCount



proc createRasterAttributeTable*(): GDALRasterAttributeTableH {.stdcall,
    importc: "GDALCreateRasterAttributeTable", dynlib: dynlibgdal.}
proc destroyRasterAttributeTable*(a1: GDALRasterAttributeTableH) {.stdcall,
    importc: "GDALDestroyRasterAttributeTable", dynlib: dynlibgdal.}
proc rATGetColumnCount*(a1: GDALRasterAttributeTableH): cint {.stdcall,
    importc: "GDALRATGetColumnCount", dynlib: dynlibgdal.}
proc rATGetNameOfCol*(a1: GDALRasterAttributeTableH; a2: cint): cstring {.stdcall,
    importc: "GDALRATGetNameOfCol", dynlib: dynlibgdal.}
proc rATGetUsageOfCol*(a1: GDALRasterAttributeTableH; a2: cint): GDALRATFieldUsage {.
    stdcall, importc: "GDALRATGetUsageOfCol", dynlib: dynlibgdal.}
proc rATGetTypeOfCol*(a1: GDALRasterAttributeTableH; a2: cint): GDALRATFieldType {.
    stdcall, importc: "GDALRATGetTypeOfCol", dynlib: dynlibgdal.}
proc rATGetColOfUsage*(a1: GDALRasterAttributeTableH; a2: GDALRATFieldUsage): cint {.
    stdcall, importc: "GDALRATGetColOfUsage", dynlib: dynlibgdal.}
proc rATGetRowCount*(a1: GDALRasterAttributeTableH): cint {.stdcall,
    importc: "GDALRATGetRowCount", dynlib: dynlibgdal.}
proc rATGetValueAsString*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint): cstring {.
    stdcall, importc: "GDALRATGetValueAsString", dynlib: dynlibgdal.}
proc rATGetValueAsInt*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint): cint {.
    stdcall, importc: "GDALRATGetValueAsInt", dynlib: dynlibgdal.}
proc rATGetValueAsDouble*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint): cdouble {.
    stdcall, importc: "GDALRATGetValueAsDouble", dynlib: dynlibgdal.}
proc rATSetValueAsString*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint;
                             a4: cstring) {.stdcall,
    importc: "GDALRATSetValueAsString", dynlib: dynlibgdal.}
proc rATSetValueAsInt*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint; a4: cint) {.
    stdcall, importc: "GDALRATSetValueAsInt", dynlib: dynlibgdal.}
proc rATSetValueAsDouble*(a1: GDALRasterAttributeTableH; a2: cint; a3: cint;
                             a4: cdouble) {.stdcall,
    importc: "GDALRATSetValueAsDouble", dynlib: dynlibgdal.}
proc rATChangesAreWrittenToFile*(hRAT: GDALRasterAttributeTableH): cint {.
    stdcall, importc: "GDALRATChangesAreWrittenToFile", dynlib: dynlibgdal.}
proc rATValuesIOAsDouble*(hRAT: GDALRasterAttributeTableH; eRWFlag: GDALRWFlag;
                             iField: cint; iStartRow: cint; iLength: cint;
                             pdfData: ptr cdouble): CPLErr {.stdcall,
    importc: "GDALRATValuesIOAsDouble", dynlib: dynlibgdal.}
proc rATValuesIOAsInteger*(hRAT: GDALRasterAttributeTableH;
                              eRWFlag: GDALRWFlag; iField: cint; iStartRow: cint;
                              iLength: cint; pnData: ptr cint): CPLErr {.stdcall,
    importc: "GDALRATValuesIOAsInteger", dynlib: dynlibgdal.}
proc rATValuesIOAsString*(hRAT: GDALRasterAttributeTableH; eRWFlag: GDALRWFlag;
                             iField: cint; iStartRow: cint; iLength: cint;
                             papszStrList: cstringArray): CPLErr {.stdcall,
    importc: "GDALRATValuesIOAsString", dynlib: dynlibgdal.}
proc rATSetRowCount*(a1: GDALRasterAttributeTableH; a2: cint) {.stdcall,
    importc: "GDALRATSetRowCount", dynlib: dynlibgdal.}
proc rATCreateColumn*(a1: GDALRasterAttributeTableH; a2: cstring;
                         a3: GDALRATFieldType; a4: GDALRATFieldUsage): CPLErr {.
    stdcall, importc: "GDALRATCreateColumn", dynlib: dynlibgdal.}
proc rATSetLinearBinning*(a1: GDALRasterAttributeTableH; a2: cdouble; a3: cdouble): CPLErr {.
    stdcall, importc: "GDALRATSetLinearBinning", dynlib: dynlibgdal.}
proc rATGetLinearBinning*(a1: GDALRasterAttributeTableH; a2: ptr cdouble;
                             a3: ptr cdouble): cint {.stdcall,
    importc: "GDALRATGetLinearBinning", dynlib: dynlibgdal.}
proc rATInitializeFromColorTable*(a1: GDALRasterAttributeTableH;
                                     a2: GDALColorTableH): CPLErr {.stdcall,
    importc: "GDALRATInitializeFromColorTable", dynlib: dynlibgdal.}
proc rATTranslateToColorTable*(a1: GDALRasterAttributeTableH; nEntryCount: cint): GDALColorTableH {.
    stdcall, importc: "GDALRATTranslateToColorTable", dynlib: dynlibgdal.}
proc rATDumpReadable*(a1: GDALRasterAttributeTableH; a2: ptr FILE) {.stdcall,
    importc: "GDALRATDumpReadable", dynlib: dynlibgdal.}
proc rATClone*(a1: GDALRasterAttributeTableH): GDALRasterAttributeTableH {.
    stdcall, importc: "GDALRATClone", dynlib: dynlibgdal.}
proc rATSerializeJSON*(a1: GDALRasterAttributeTableH): pointer {.stdcall,
    importc: "GDALRATSerializeJSON", dynlib: dynlibgdal.}
proc rATGetRowOfValue*(a1: GDALRasterAttributeTableH; a2: cdouble): cint {.
    stdcall, importc: "GDALRATGetRowOfValue", dynlib: dynlibgdal.}
proc setCacheMax*(nBytes: cint) {.stdcall, importc: "GDALSetCacheMax",
                                   dynlib: dynlibgdal.}
proc getCacheMax*(): cint {.stdcall, importc: "GDALGetCacheMax",
                             dynlib: dynlibgdal.}
proc getCacheUsed*(): cint {.stdcall, importc: "GDALGetCacheUsed",
                              dynlib: dynlibgdal.}
proc setCacheMax64*(nBytes: GIntBig) {.stdcall, importc: "GDALSetCacheMax64",
                                        dynlib: dynlibgdal.}
proc getCacheMax64*(): GIntBig {.stdcall, importc: "GDALGetCacheMax64",
                                  dynlib: dynlibgdal.}
proc getCacheUsed64*(): GIntBig {.stdcall, importc: "GDALGetCacheUsed64",
                                   dynlib: dynlibgdal.}
proc flushCacheBlock*(): cint {.stdcall, importc: "GDALFlushCacheBlock",
                                 dynlib: dynlibgdal.}
proc getVirtualMem*(hDS: GDALDatasetH; eRWFlag: GDALRWFlag; nXOff: cint;
                              nYOff: cint; nXSize: cint; nYSize: cint;
                              nBufXSize: cint; nBufYSize: cint;
                              eBufType: GDALDataType; nBandCount: cint;
                              panBandMap: ptr cint; nPixelSpace: cint;
                              nLineSpace: GIntBig; nBandSpace: GIntBig;
                              nCacheSize: csize; nPageSizeHint: csize;
                              bSingleThreadUsage: cint; papszOptions: cstringArray): ptr CPLVirtualMem {.
    stdcall, importc: "GDALDatasetGetVirtualMem", dynlib: dynlibgdal.}
proc rasterBandGetVirtualMem*(hBand: GDALRasterBandH; eRWFlag: GDALRWFlag;
                                 nXOff: cint; nYOff: cint; nXSize: cint; nYSize: cint;
                                 nBufXSize: cint; nBufYSize: cint;
                                 eBufType: GDALDataType; nPixelSpace: cint;
                                 nLineSpace: GIntBig; nCacheSize: csize;
                                 nPageSizeHint: csize; bSingleThreadUsage: cint;
                                 papszOptions: cstringArray): ptr CPLVirtualMem {.
    stdcall, importc: "GDALRasterBandGetVirtualMem", dynlib: dynlibgdal.}
proc getVirtualMemAuto*(hBand: GDALRasterBandH; eRWFlag: GDALRWFlag;
                           pnPixelSpace: ptr cint; pnLineSpace: ptr GIntBig;
                           papszOptions: cstringArray): ptr CPLVirtualMem {.stdcall,
    importc: "GDALGetVirtualMemAuto", dynlib: dynlibgdal.}
type
  GDALTileOrganization* {.size: sizeof(cint).} = enum
    GTO_TIP, GTO_BIT, GTO_BSQ


proc getTiledVirtualMem*(hDS: GDALDatasetH; eRWFlag: GDALRWFlag;
                                   nXOff: cint; nYOff: cint; nXSize: cint;
                                   nYSize: cint; nTileXSize: cint; nTileYSize: cint;
                                   eBufType: GDALDataType; nBandCount: cint;
                                   panBandMap: ptr cint;
                                   eTileOrganization: GDALTileOrganization;
                                   nCacheSize: csize; bSingleThreadUsage: cint;
                                   papszOptions: cstringArray): ptr CPLVirtualMem {.
    stdcall, importc: "GDALDatasetGetTiledVirtualMem", dynlib: dynlibgdal.}
proc rasterBandGetTiledVirtualMem*(hBand: GDALRasterBandH; eRWFlag: GDALRWFlag;
                                      nXOff: cint; nYOff: cint; nXSize: cint;
                                      nYSize: cint; nTileXSize: cint;
                                      nTileYSize: cint; eBufType: GDALDataType;
                                      nCacheSize: csize; bSingleThreadUsage: cint;
                                      papszOptions: cstringArray): ptr CPLVirtualMem {.
    stdcall, importc: "GDALRasterBandGetTiledVirtualMem", dynlib: dynlibgdal.}
proc createPansharpenedVRT*(pszXML: cstring; hPanchroBand: GDALRasterBandH;
                               nInputSpectralBands: cint;
                               pahInputSpectralBands: ptr GDALRasterBandH): GDALDatasetH {.
    stdcall, importc: "GDALCreatePansharpenedVRT", dynlib: dynlibgdal.}
proc getJPEG2000Structure*(pszFilename: cstring; papszOptions: cstringArray): ptr CPLXMLNode {.
    stdcall, importc: "GDALGetJPEG2000Structure", dynlib: dynlibgdal.}