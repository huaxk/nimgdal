import cpl_port
#import src/wrap/raw/cpl_error
when defined(Windows):
  const dynlibcpl_vsi = "libgdal.dll"

when defined(Linux):
  const dynlibcpl_vsi = "libgdal.so"

when defined(MacOSX):
  const dynlibcpl_vsi = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
const
  VSI_STAT_EXISTS_FLAG* = 0x00000001
  VSI_STAT_NATURE_FLAG* = 0x00000002
  VSI_STAT_SIZE_FLAG* = 0x00000004
  VSI_STAT_SET_ERROR_FLAG* = 0x00000008

proc VSIFOpen*(a1: cstring; a2: cstring): ptr FILE {.stdcall, importc: "VSIFOpen",
    dynlib: dynlibcpl_vsi.}
proc VSIFClose*(a1: ptr FILE): cint {.stdcall, importc: "VSIFClose",
                                 dynlib: dynlibcpl_vsi.}
proc VSIFSeek*(a1: ptr FILE; a2: clong; a3: cint): cint {.stdcall, importc: "VSIFSeek",
    dynlib: dynlibcpl_vsi.}
proc VSIFTell*(a1: ptr FILE): clong {.stdcall, importc: "VSIFTell",
                                 dynlib: dynlibcpl_vsi.}
proc VSIRewind*(a1: ptr FILE) {.stdcall, importc: "VSIRewind", dynlib: dynlibcpl_vsi.}
proc VSIFFlush*(a1: ptr FILE) {.stdcall, importc: "VSIFFlush", dynlib: dynlibcpl_vsi.}
proc VSIFRead*(a1: pointer; a2: csize; a3: csize; a4: ptr FILE): csize {.stdcall,
    importc: "VSIFRead", dynlib: dynlibcpl_vsi.}
proc VSIFWrite*(a1: pointer; a2: csize; a3: csize; a4: ptr FILE): csize {.stdcall,
    importc: "VSIFWrite", dynlib: dynlibcpl_vsi.}
proc VSIFGets*(a1: cstring; a2: cint; a3: ptr FILE): cstring {.stdcall,
    importc: "VSIFGets", dynlib: dynlibcpl_vsi.}
proc VSIFPuts*(a1: cstring; a2: ptr FILE): cint {.stdcall, importc: "VSIFPuts",
    dynlib: dynlibcpl_vsi.}
proc VSIFPrintf*(a1: ptr FILE; a2: cstring): cint {.varargs, stdcall,
    importc: "VSIFPrintf", dynlib: dynlibcpl_vsi.}
proc VSIFGetc*(a1: ptr FILE): cint {.stdcall, importc: "VSIFGetc", dynlib: dynlibcpl_vsi.}
proc VSIFPutc*(a1: cint; a2: ptr FILE): cint {.stdcall, importc: "VSIFPutc",
                                        dynlib: dynlibcpl_vsi.}
proc VSIUngetc*(a1: cint; a2: ptr FILE): cint {.stdcall, importc: "VSIUngetc",
    dynlib: dynlibcpl_vsi.}
proc VSIFEof*(a1: ptr FILE): cint {.stdcall, importc: "VSIFEof", dynlib: dynlibcpl_vsi.}
type
  tm* = object
  time_t* = clong
  VSIStatBuf* = object

proc VSIStat*(a1: cstring; a2: ptr VSIStatBuf): cint {.stdcall, importc: "VSIStat",
    dynlib: dynlibcpl_vsi.}
type
  vsi_l_offset* = GUIntBig
  VSILFILE* = FILE

proc VSIFOpenL*(a1: cstring; a2: cstring): ptr VSILFILE {.stdcall, importc: "VSIFOpenL",
    dynlib: dynlibcpl_vsi.}
proc VSIFOpenExL*(a1: cstring; a2: cstring; a3: cint): ptr VSILFILE {.stdcall,
    importc: "VSIFOpenExL", dynlib: dynlibcpl_vsi.}
proc VSIFCloseL*(a1: ptr VSILFILE): cint {.stdcall, importc: "VSIFCloseL",
                                      dynlib: dynlibcpl_vsi.}
proc VSIFSeekL*(a1: ptr VSILFILE; a2: vsi_l_offset; a3: cint): cint {.stdcall,
    importc: "VSIFSeekL", dynlib: dynlibcpl_vsi.}
proc VSIFTellL*(a1: ptr VSILFILE): vsi_l_offset {.stdcall, importc: "VSIFTellL",
    dynlib: dynlibcpl_vsi.}
proc VSIRewindL*(a1: ptr VSILFILE) {.stdcall, importc: "VSIRewindL",
                                 dynlib: dynlibcpl_vsi.}
proc VSIFReadL*(a1: pointer; a2: csize; a3: csize; a4: ptr VSILFILE): csize {.stdcall,
    importc: "VSIFReadL", dynlib: dynlibcpl_vsi.}
proc VSIFReadMultiRangeL*(nRanges: cint; ppData: ptr pointer;
                         panOffsets: ptr vsi_l_offset; panSizes: ptr csize;
                         a5: ptr VSILFILE): cint {.stdcall,
    importc: "VSIFReadMultiRangeL", dynlib: dynlibcpl_vsi.}
proc VSIFWriteL*(a1: pointer; a2: csize; a3: csize; a4: ptr VSILFILE): csize {.stdcall,
    importc: "VSIFWriteL", dynlib: dynlibcpl_vsi.}
proc VSIFEofL*(a1: ptr VSILFILE): cint {.stdcall, importc: "VSIFEofL",
                                    dynlib: dynlibcpl_vsi.}
proc VSIFTruncateL*(a1: ptr VSILFILE; a2: vsi_l_offset): cint {.stdcall,
    importc: "VSIFTruncateL", dynlib: dynlibcpl_vsi.}
proc VSIFFlushL*(a1: ptr VSILFILE): cint {.stdcall, importc: "VSIFFlushL",
                                      dynlib: dynlibcpl_vsi.}
proc VSIFPrintfL*(a1: ptr VSILFILE; a2: cstring): cint {.varargs, stdcall,
    importc: "VSIFPrintfL", dynlib: dynlibcpl_vsi.}
proc VSIFPutcL*(a1: cint; a2: ptr VSILFILE): cint {.stdcall, importc: "VSIFPutcL",
    dynlib: dynlibcpl_vsi.}
type
  VSIRangeStatus* {.size: sizeof(cint).} = enum
    VSI_RANGE_STATUS_UNKNOWN, VSI_RANGE_STATUS_DATA, VSI_RANGE_STATUS_HOLE


proc VSIFGetRangeStatusL*(fp: ptr VSILFILE; nStart: vsi_l_offset;
                         nLength: vsi_l_offset): VSIRangeStatus {.stdcall,
    importc: "VSIFGetRangeStatusL", dynlib: dynlibcpl_vsi.}
proc VSIIngestFile*(fp: ptr VSILFILE; pszFilename: cstring; ppabyRet: ptr ptr GByte;
                   pnSize: ptr vsi_l_offset; nMaxSize: GIntBig): cint {.stdcall,
    importc: "VSIIngestFile", dynlib: dynlibcpl_vsi.}
proc VSIStatL*(a1: cstring; a2: ptr VSIStatBuf): cint {.stdcall, importc: "VSIStatL",
    dynlib: dynlibcpl_vsi.}
proc VSIStatExL*(pszFilename: cstring; psStatBuf: ptr VSIStatBuf; nFlags: cint): cint {.
    stdcall, importc: "VSIStatExL", dynlib: dynlibcpl_vsi.}
proc VSIIsCaseSensitiveFS*(pszFilename: cstring): cint {.stdcall,
    importc: "VSIIsCaseSensitiveFS", dynlib: dynlibcpl_vsi.}
proc VSISupportsSparseFiles*(pszPath: cstring): cint {.stdcall,
    importc: "VSISupportsSparseFiles", dynlib: dynlibcpl_vsi.}
proc VSIFGetNativeFileDescriptorL*(a1: ptr VSILFILE): pointer {.stdcall,
    importc: "VSIFGetNativeFileDescriptorL", dynlib: dynlibcpl_vsi.}
proc VSICalloc*(a1: csize; a2: csize): pointer {.stdcall, importc: "VSICalloc",
    dynlib: dynlibcpl_vsi.}
proc VSIMalloc*(a1: csize): pointer {.stdcall, importc: "VSIMalloc",
                                  dynlib: dynlibcpl_vsi.}
proc VSIFree*(a1: pointer) {.stdcall, importc: "VSIFree", dynlib: dynlibcpl_vsi.}
proc VSIRealloc*(a1: pointer; a2: csize): pointer {.stdcall, importc: "VSIRealloc",
    dynlib: dynlibcpl_vsi.}
proc VSIStrdup*(a1: cstring): cstring {.stdcall, importc: "VSIStrdup",
                                    dynlib: dynlibcpl_vsi.}
proc VSIMallocAligned*(nAlignment: csize; nSize: csize): pointer {.stdcall,
    importc: "VSIMallocAligned", dynlib: dynlibcpl_vsi.}
proc VSIMallocAlignedAuto*(nSize: csize): pointer {.stdcall,
    importc: "VSIMallocAlignedAuto", dynlib: dynlibcpl_vsi.}
proc VSIFreeAligned*(`ptr`: pointer) {.stdcall, importc: "VSIFreeAligned",
                                    dynlib: dynlibcpl_vsi.}
proc VSIMallocAlignedAutoVerbose*(nSize: csize; pszFile: cstring; nLine: cint): pointer {.
    stdcall, importc: "VSIMallocAlignedAutoVerbose", dynlib: dynlibcpl_vsi.}
proc VSIMalloc2*(nSize1: csize; nSize2: csize): pointer {.stdcall,
    importc: "VSIMalloc2", dynlib: dynlibcpl_vsi.}
proc VSIMalloc3*(nSize1: csize; nSize2: csize; nSize3: csize): pointer {.stdcall,
    importc: "VSIMalloc3", dynlib: dynlibcpl_vsi.}
proc VSIMallocVerbose*(nSize: csize; pszFile: cstring; nLine: cint): pointer {.stdcall,
    importc: "VSIMallocVerbose", dynlib: dynlibcpl_vsi.}
proc VSIMalloc2Verbose*(nSize1: csize; nSize2: csize; pszFile: cstring; nLine: cint): pointer {.
    stdcall, importc: "VSIMalloc2Verbose", dynlib: dynlibcpl_vsi.}
proc VSIMalloc3Verbose*(nSize1: csize; nSize2: csize; nSize3: csize; pszFile: cstring;
                       nLine: cint): pointer {.stdcall,
    importc: "VSIMalloc3Verbose", dynlib: dynlibcpl_vsi.}
proc VSICallocVerbose*(nCount: csize; nSize: csize; pszFile: cstring; nLine: cint): pointer {.
    stdcall, importc: "VSICallocVerbose", dynlib: dynlibcpl_vsi.}
proc VSIReallocVerbose*(pOldPtr: pointer; nNewSize: csize; pszFile: cstring;
                       nLine: cint): pointer {.stdcall,
    importc: "VSIReallocVerbose", dynlib: dynlibcpl_vsi.}
proc VSIStrdupVerbose*(pszStr: cstring; pszFile: cstring; nLine: cint): cstring {.
    stdcall, importc: "VSIStrdupVerbose", dynlib: dynlibcpl_vsi.}
proc getPhysicalRAM*(): GIntBig {.stdcall, importc: "CPLGetPhysicalRAM",
                                  dynlib: dynlibcpl_vsi.}
proc getUsablePhysicalRAM*(): GIntBig {.stdcall,
                                        importc: "CPLGetUsablePhysicalRAM",
                                        dynlib: dynlibcpl_vsi.}
proc VSIReadDir*(a1: cstring): cstringArray {.stdcall, importc: "VSIReadDir",
    dynlib: dynlibcpl_vsi.}
proc VSIReadDirRecursive*(pszPath: cstring): cstringArray {.stdcall,
    importc: "VSIReadDirRecursive", dynlib: dynlibcpl_vsi.}
proc VSIReadDirEx*(pszPath: cstring; nMaxFiles: cint): cstringArray {.stdcall,
    importc: "VSIReadDirEx", dynlib: dynlibcpl_vsi.}
proc VSIMkdir*(pathname: cstring; mode: clong): cint {.stdcall, importc: "VSIMkdir",
    dynlib: dynlibcpl_vsi.}
proc VSIRmdir*(pathname: cstring): cint {.stdcall, importc: "VSIRmdir",
                                      dynlib: dynlibcpl_vsi.}
proc VSIUnlink*(pathname: cstring): cint {.stdcall, importc: "VSIUnlink",
                                       dynlib: dynlibcpl_vsi.}
proc VSIRename*(oldpath: cstring; newpath: cstring): cint {.stdcall,
    importc: "VSIRename", dynlib: dynlibcpl_vsi.}
proc VSIStrerror*(a1: cint): cstring {.stdcall, importc: "VSIStrerror",
                                   dynlib: dynlibcpl_vsi.}
proc VSIGetDiskFreeSpace*(pszDirname: cstring): GIntBig {.stdcall,
    importc: "VSIGetDiskFreeSpace", dynlib: dynlibcpl_vsi.}
proc VSIInstallMemFileHandler*() {.stdcall, importc: "VSIInstallMemFileHandler",
                                 dynlib: dynlibcpl_vsi.}
proc VSIInstallLargeFileHandler*() {.stdcall,
                                   importc: "VSIInstallLargeFileHandler",
                                   dynlib: dynlibcpl_vsi.}
proc VSIInstallSubFileHandler*() {.stdcall, importc: "VSIInstallSubFileHandler",
                                 dynlib: dynlibcpl_vsi.}
proc VSIInstallCurlFileHandler*() {.stdcall, importc: "VSIInstallCurlFileHandler",
                                  dynlib: dynlibcpl_vsi.}
proc VSICurlClearCache*() {.stdcall, importc: "VSICurlClearCache",
                          dynlib: dynlibcpl_vsi.}
proc VSIInstallCurlStreamingFileHandler*() {.stdcall,
    importc: "VSIInstallCurlStreamingFileHandler", dynlib: dynlibcpl_vsi.}
proc VSIInstallS3FileHandler*() {.stdcall, importc: "VSIInstallS3FileHandler",
                                dynlib: dynlibcpl_vsi.}
proc VSIInstallS3StreamingFileHandler*() {.stdcall,
    importc: "VSIInstallS3StreamingFileHandler", dynlib: dynlibcpl_vsi.}
proc VSIInstallGSFileHandler*() {.stdcall, importc: "VSIInstallGSFileHandler",
                                dynlib: dynlibcpl_vsi.}
proc VSIInstallGSStreamingFileHandler*() {.stdcall,
    importc: "VSIInstallGSStreamingFileHandler", dynlib: dynlibcpl_vsi.}
proc VSIInstallGZipFileHandler*() {.stdcall, importc: "VSIInstallGZipFileHandler",
                                  dynlib: dynlibcpl_vsi.}
proc VSIInstallZipFileHandler*() {.stdcall, importc: "VSIInstallZipFileHandler",
                                 dynlib: dynlibcpl_vsi.}
proc VSIInstallStdinHandler*() {.stdcall, importc: "VSIInstallStdinHandler",
                               dynlib: dynlibcpl_vsi.}
proc VSIInstallStdoutHandler*() {.stdcall, importc: "VSIInstallStdoutHandler",
                                dynlib: dynlibcpl_vsi.}
proc VSIInstallSparseFileHandler*() {.stdcall,
                                    importc: "VSIInstallSparseFileHandler",
                                    dynlib: dynlibcpl_vsi.}
proc VSIInstallTarFileHandler*() {.stdcall, importc: "VSIInstallTarFileHandler",
                                 dynlib: dynlibcpl_vsi.}
proc VSIInstallCryptFileHandler*() {.stdcall,
                                   importc: "VSIInstallCryptFileHandler",
                                   dynlib: dynlibcpl_vsi.}
proc VSISetCryptKey*(pabyKey: ptr GByte; nKeySize: cint) {.stdcall,
    importc: "VSISetCryptKey", dynlib: dynlibcpl_vsi.}
proc VSICleanupFileManager*() {.stdcall, importc: "VSICleanupFileManager",
                              dynlib: dynlibcpl_vsi.}
proc VSIFileFromMemBuffer*(pszFilename: cstring; pabyData: ptr GByte;
                          nDataLength: vsi_l_offset; bTakeOwnership: cint): ptr VSILFILE {.
    stdcall, importc: "VSIFileFromMemBuffer", dynlib: dynlibcpl_vsi.}
proc VSIGetMemFileBuffer*(pszFilename: cstring; pnDataLength: ptr vsi_l_offset;
                         bUnlinkAndSeize: cint): ptr GByte {.stdcall,
    importc: "VSIGetMemFileBuffer", dynlib: dynlibcpl_vsi.}
type
  VSIWriteFunction* = proc (`ptr`: pointer; size: csize; nmemb: csize; stream: ptr FILE): csize {.
      stdcall.}

proc VSIStdoutSetRedirection*(pFct: VSIWriteFunction; stream: ptr FILE) {.stdcall,
    importc: "VSIStdoutSetRedirection", dynlib: dynlibcpl_vsi.}
proc VSITime*(a1: ptr culong): culong {.stdcall, importc: "VSITime",
                                   dynlib: dynlibcpl_vsi.}
proc VSICTime*(a1: culong): cstring {.stdcall, importc: "VSICTime",
                                  dynlib: dynlibcpl_vsi.}
proc VSIGMTime*(pnTime: ptr time_t; poBrokenTime: ptr tm): ptr tm {.stdcall,
    importc: "VSIGMTime", dynlib: dynlibcpl_vsi.}
proc VSILocalTime*(pnTime: ptr time_t; poBrokenTime: ptr tm): ptr tm {.stdcall,
    importc: "VSILocalTime", dynlib: dynlibcpl_vsi.}