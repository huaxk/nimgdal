import cpl_port
#import src/wrap/raw/cpl_port
#import src/wrap/raw/cpl_vsi
when defined(Windows):
  const dynlibcpl_virtualmem = "libgdal.dll"

when defined(Linux):
  const dynlibcpl_virtualmem = "libgdal.so"

when defined(MacOSX):
  const dynlibcpl_virtualmem = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
type
  CPLVirtualMem* = object
  VSILFILE* = FILE
  vsi_l_offset* = GUIntBig

  CPLVirtualMemCachePageCbk* = proc (ctxt: ptr CPLVirtualMem; nOffset: csize;
                                  pPageToFill: pointer; nToFill: csize;
                                  pUserData: pointer) {.stdcall.}
  CPLVirtualMemUnCachePageCbk* = proc (ctxt: ptr CPLVirtualMem; nOffset: csize;
                                    pPageToBeEvicted: pointer;
                                    nToBeEvicted: csize; pUserData: pointer) {.
      stdcall.}
  CPLVirtualMemFreeUserData* = proc (pUserData: pointer) {.stdcall.}
  CPLVirtualMemAccessMode* {.size: sizeof(cint).} = enum
    VIRTUALMEM_READONLY, VIRTUALMEM_READONLY_ENFORCED, VIRTUALMEM_READWRITE


proc getPageSize*(): csize {.stdcall, importc: "CPLGetPageSize",
                             dynlib: dynlibcpl_virtualmem.}
proc virtualMemNew*(nSize: csize; nCacheSize: csize; nPageSizeHint: csize;
                      bSingleThreadUsage: cint;
                      eAccessMode: CPLVirtualMemAccessMode;
                      pfnCachePage: CPLVirtualMemCachePageCbk;
                      pfnUnCachePage: CPLVirtualMemUnCachePageCbk;
                      pfnFreeUserData: CPLVirtualMemFreeUserData;
                      pCbkUserData: pointer): ptr CPLVirtualMem {.stdcall,
    importc: "CPLVirtualMemNew", dynlib: dynlibcpl_virtualmem.}
proc isVirtualMemFileMapAvailable*(): cint {.stdcall,
    importc: "CPLIsVirtualMemFileMapAvailable", dynlib: dynlibcpl_virtualmem.}
proc virtualMemFileMapNew*(fp: ptr VSILFILE; nOffset: vsi_l_offset;
                             nLength: vsi_l_offset;
                             eAccessMode: CPLVirtualMemAccessMode;
                             pfnFreeUserData: CPLVirtualMemFreeUserData;
                             pCbkUserData: pointer): ptr CPLVirtualMem {.stdcall,
    importc: "CPLVirtualMemFileMapNew", dynlib: dynlibcpl_virtualmem.}
proc virtualMemDerivedNew*(pVMemBase: ptr CPLVirtualMem; nOffset: vsi_l_offset;
                             nSize: vsi_l_offset;
                             pfnFreeUserData: CPLVirtualMemFreeUserData;
                             pCbkUserData: pointer): ptr CPLVirtualMem {.stdcall,
    importc: "CPLVirtualMemDerivedNew", dynlib: dynlibcpl_virtualmem.}
proc virtualMemFree*(ctxt: ptr CPLVirtualMem) {.stdcall,
    importc: "CPLVirtualMemFree", dynlib: dynlibcpl_virtualmem.}
proc virtualMemGetAddr*(ctxt: ptr CPLVirtualMem): pointer {.stdcall,
    importc: "CPLVirtualMemGetAddr", dynlib: dynlibcpl_virtualmem.}
proc virtualMemGetSize*(ctxt: ptr CPLVirtualMem): csize {.stdcall,
    importc: "CPLVirtualMemGetSize", dynlib: dynlibcpl_virtualmem.}
proc virtualMemIsFileMapping*(ctxt: ptr CPLVirtualMem): cint {.stdcall,
    importc: "CPLVirtualMemIsFileMapping", dynlib: dynlibcpl_virtualmem.}
proc virtualMemGetAccessMode*(ctxt: ptr CPLVirtualMem): CPLVirtualMemAccessMode {.
    stdcall, importc: "CPLVirtualMemGetAccessMode", dynlib: dynlibcpl_virtualmem.}
proc virtualMemGetPageSize*(ctxt: ptr CPLVirtualMem): csize {.stdcall,
    importc: "CPLVirtualMemGetPageSize", dynlib: dynlibcpl_virtualmem.}
proc virtualMemIsAccessThreadSafe*(ctxt: ptr CPLVirtualMem): cint {.stdcall,
    importc: "CPLVirtualMemIsAccessThreadSafe", dynlib: dynlibcpl_virtualmem.}
proc virtualMemDeclareThread*(ctxt: ptr CPLVirtualMem) {.stdcall,
    importc: "CPLVirtualMemDeclareThread", dynlib: dynlibcpl_virtualmem.}
proc virtualMemUnDeclareThread*(ctxt: ptr CPLVirtualMem) {.stdcall,
    importc: "CPLVirtualMemUnDeclareThread", dynlib: dynlibcpl_virtualmem.}
proc virtualMemPin*(ctxt: ptr CPLVirtualMem; pAddr: pointer; nSize: csize;
                      bWriteOp: cint) {.stdcall, importc: "CPLVirtualMemPin",
                                      dynlib: dynlibcpl_virtualmem.}
proc virtualMemManagerTerminate*() {.stdcall,
                                      importc: "CPLVirtualMemManagerTerminate",
                                      dynlib: dynlibcpl_virtualmem.}