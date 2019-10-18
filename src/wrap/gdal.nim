import os
import nimterop/cimport

static:
  # cDebug()
  # cDisableCaching()
  cSkipSymbol(@["stat", "stat64"])

when defined(linux):
  # install libgdal-dev
  const
    dyngdal = "libgdal.so"
    srcDir = "/usr/include/gdal"
    gdalH = srcDir/"gdal.h"
   
  cIncludeDir(srcDir)

elif defined(windows):
  # only works on nimterop@0.1.0
  import strutils, strformat
  # import nimterop/[git, paths]

  const
    dyngdal = "libgdal.dll"
    gdalversion = "2.2.4"
    # baseDir = nimteropBuildDir()/"gdal"
    baseDir = currentSourcePath.parentDir()
    srcDir = baseDir/"gdal"
    gdalH = srcDir/"gcore/gdal.h"
    srczipname = fmt"""gdal{gdalversion.replace(".")}.zip"""
  # static:
  #   gitPull("https://github.com/OSGeo/gdal", outdir=baseDir, plist="gdal/*\nautotest/*", checkout="v" & gdalversion)

  #   if not gdalH.fileExists():
  #     downloadUrl(fmt"http://download.osgeo.org/gdal/{srczipname}", outdir=baseDir)
  #     # movefile(fmt"gdal-{gdalversion}", "gdal")
  #     extractZip(baseDir/srczipname, baseDir)

  #   cpFile(srcDir/"port/cpl_config.h.in", srcDir/"port/cpl_config.h")
  #   cpFile(srcDir/"gcore/gdal_version.h.in", srcDir/"port/gdal_version.h")
     
  cIncludeDir(srcDir/"port")
  cIncludeDir(srcDir/"ogr")
  cIncludeDir(srcDir/"gcore")    

else:
  static: doAssert false

cOverride:
  type
    stat64* {.pure,final.} = object
    VSIStatBuf* = object
    VSIStatBufL* = VSIStatBuf
    tm* = object
    OGRGeomFieldDefn = object
    OGRGeomFieldDefnH* = ptr OGRGeomFieldDefn
    
    GDALExtendedDataTypeHS* = object
    GDALExtendedDataTypeH* = ptr GDALExtendedDataTypeHS
    GDALEDTComponentHS* = object
    GDALEDTComponentH* = ptr GDALEDTComponentHS
    GDALGroupHS* = object
    GDALGroupH* = ptr GDALGroupHS
    GDALMDArrayHS* = object
    GDALMDArrayH* = ptr GDALMDArrayHS
    GDALAttributeHS* = object
    GDALAttributeH* = ptr GDALAttributeHS
    GDALDimensionHS* = object
    GDALDimensionH* = ptr GDALDimensionHS
    CSLConstList* = cstringArray
    OGRField* {.pure,final.} = object
    OGREnvelope* {.pure,final.} = object
      MinX: float
      MaxX: float
      MinY: float
      MaxY: float
    OGREnvelope3D* {.pure,final.} = object
      MinX: float
      MaxX: float
      MinY: float
      MaxY: float
      MinZ: float
      MaxZ: float

    # override {.impogr_api.}
    OGRGeometry = object
    OGRGeometryH* = ptr OGRGeometry
    OGRSpatialReference = object
    OGRSpatialReferenceH* = ptr OGRSpatialReference
    OGRCoordinateTransformation = object
    OGRCoordinateTransformationH* = ptr OGRCoordinateTransformation

    OGRFieldDefn = object
    OGRFieldDefnH* = ptr OGRFieldDefn
    OGRFeatureDefn = object
    OGRFeatureDefnH* = ptr OGRFeatureDefn
    OGRFeature = object
    OGRFeatureH* = ptr OGRFeature
    OGRStyleTable = object
    OGRStyleTableH* = ptr OGRStyleTable

    OGRLayer = object
    OGRLayerH* = ptr OGRLayer
    OGRDataSource = object
    OGRDataSourceH* = ptr OGRDataSource
    OGRSFDriver = object
    OGRSFDriverH* = ptr OGRSFDriver

    OGRStyleMgr = object
    OGRStyleMgrH* = ptr OGRStyleMgr
    OGRStyleTool = object
    OGRStyleToolH* = ptr OGRStyleTool    

    GDALMajorObject = object
    GDALMajorObjectH* = ptr GDALMajorObject
    GDALDataset = object
    GDALDatasetH* = ptr GDALDataset
    GDALRasterBand = object
    GDALRasterBandH* = ptr GDALRasterBand
    GDALDriver = object
    GDALDriverH* = ptr GDALDriver
    GDALColorTable = object
    GDALColorTableH* = ptr GDALColorTable
    GDALRasterAttributeTable = object
    GDALRasterAttributeTableH* = ptr GDALRasterAttributeTable
    GDALAsyncReader = object
    GDALAsyncReaderH* = ptr GDALAsyncReader

cPlugin:
  import strutils

  # proc lowercaseAscii(s: string): string =
  #   if s.len == 0: result = ""
  #   else: result = toLowerAscii(s[0]) & substr(s, 1)

  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    sym.name = sym.name.strip(chars = {'_'})

    if sym.kind == nskProc:
      if sym.name.contains("GDAL"):
        sym.name = sym.name.replace("GDAL")
      elif sym.name.contains("OGR_DS_"):
        sym.name = sym.name.replace("OGR_DS_")
      elif sym.name.contains("OGR_L_"):
        sym.name = sym.name.replace("OGR_L_")
      elif sym.name.contains("OGR_F_"):
        sym.name = sym.name.replace("OGR_F_")
      elif sym.name.contains("OGR_G_"):
        sym.name = sym.name.replace("OGR_G_")
      elif sym.name.contains("OGR_FD_"):
        sym.name = sym.name.replace("OGR_FD_")

cImport(gdalH, recurse=true, dynlib="dyngdal")

{.pragma: impgdalD, cdecl, dynlib: dyngdal.}
{.pragma: impOGR_L, importC:"OGR_L_$1", impgdalD.}
{.pragma: impOGR_DS, importC:"OGR_DS_$1", impgdalD.}
{.pragma: impOGR_F, importC:"OGR_F_$1", impgdalD.}
{.pragma: impOGR_G, importC:"OGR_G_$1", impgdalD.}
{.pragma: impOGR_FD, importC:"OGR_FD_$1", impgdalD.}

proc Destroy*(a1: OGRDataSourceH) {.impOGR_DS.}
proc Destroy*(a1: OGRFeatureH) {.impOGR_F.}
proc GetGeometryRef*(a1: OGRFeatureH): OGRGeometryH {.impOGR_F.}



# echo "GDAL version: " & $versionInfo("VERSION_NUM")
# echo "BUILD_INFO:\n" & $versionInfo("BUILD_INFO")