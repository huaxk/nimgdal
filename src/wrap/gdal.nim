import os, strformat, strutils
import nimterop/[cimport, git]
# import nimterop/paths

const
  gdalversion = "2.2.4"
  srczipname = when defined(windows):
    fmt"""gdal{gdalversion.replace(".")}.zip"""
  else:
    fmt"gdal-{gdalversion}.tar.xz"

  # baseDir = nimteropBuildDir()/"gdal"
  baseDir = currentSourcePath.parentDir()
  srcDir = baseDir/"gdal"
  gdalH = srcDir/"gcore/gdal.h"

static:
#   gitPull("https://github.com/OSGeo/gdal", outdir=baseDir, plist="""
# gdal/*
# autotest/*
# """, checkout="v" & gdalversion)

  # if not gdalH.fileExists():
  #   downloadUrl(fmt"http://download.osgeo.org/gdal/{srczipname}", outdir=baseDir)
  #   # movefile(fmt"gdal-{gdalversion}", "gdal")
  #   extractZip(baseDir/srczipname, baseDir)

  # cpFile(srcDir/"port/cpl_config.h.in", srcDir/"port/cpl_config.h")
  # cpFile(srcDir/"gcore/gdal_version.h.in", srcDir/"port/gdal_version.h")

  # cDebug()
  # cDisableCaching()
  cSkipSymbol(@["stat", "stat64"])
 
cIncludeDir(srcDir/"port")
cIncludeDir(srcDir/"ogr")
cIncludeDir(srcDir/"gcore")

const
  dyngdal = when defined(windows):
    "libgdal.dll"
  elif defined(linux):
    "libgdal.so"
  elif defined(macosx):
    "libgdal.dylib"
  else:
    static: doAssert false

cPlugin:
  import strutils

  proc lowercaseAscii(s: string): string =
    if s.len == 0: result = ""
    else: result = toLowerAscii(s[0]) & substr(s, 1)

  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    sym.name = sym.name.strip(chars = {'_'})

    # if sym.kind == nskProc:
    #   if sym.name.contains("OGR_G_"):
    #     sym.name = sym.name.replace("OGR_G_").lowercaseAscii
    #   elif sym.name.contains("OGR_L_"):
    #     sym.name = sym.name.replace("OGR_L_").lowercaseAscii
    #   elif sym.name.contains("OGR_F_"):
    #     sym.name = sym.name.replace("OGR_F_").lowercaseAscii
    #   elif sym.name.contains("OGR_FD_"):
    #     sym.name = sym.name.replace("OGR_FD_").lowercaseAscii

cOverride:
  type
    stat64* {.pure,final.} = object
    VSIStatBuf* = object
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

cImport(gdalH, recurse=true, dynlib="dyngdal")

echo "GDAL version: " & $GDALVersionInfo("VERSION_NUM")
echo "BUILD_INFO:\n" & $GDALVersionInfo("BUILD_INFO")