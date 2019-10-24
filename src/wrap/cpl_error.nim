#import src/wrap/raw/cpl_port
when defined(Windows):
  const dynlibcpl_error = "libgdal.dll"

when defined(Linux):
  const dynlibcpl_error = "libgdal.so"

when defined(MacOSX):
  const dynlibcpl_error = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
const
  CPLE_None* = 0
  CPLE_AppDefined* = 1
  CPLE_OutOfMemory* = 2
  CPLE_FileIO* = 3
  CPLE_OpenFailed* = 4
  CPLE_IllegalArg* = 5
  CPLE_NotSupported* = 6
  CPLE_AssertionFailed* = 7
  CPLE_NoWriteAccess* = 8
  CPLE_UserInterrupt* = 9
  CPLE_ObjectNull* = 10
  CPLE_HttpResponse* = 11
  CPLE_AWSBucketNotFound* = 12
  CPLE_AWSObjectNotFound* = 13
  CPLE_AWSAccessDenied* = 14
  CPLE_AWSInvalidCredentials* = 15
  CPLE_AWSSignatureDoesNotMatch* = 16

type
  CPLErr* {.size: sizeof(cint).} = enum
    CE_None = 0, CE_Debug = 1, CE_Warning = 2, CE_Failure = 3, CE_Fatal = 4
  CPLErrorNum* = cint


proc error*(eErrClass: CPLErr; err_no: CPLErrorNum; fmt: cstring) {.varargs, stdcall,
    importc: "CPLError", dynlib: dynlibcpl_error.}
#[proc errorV*(a1: CPLErr; a2: CPLErrorNum; a3: cstring; a4: va_list) {.stdcall,
    importc: "CPLErrorV", dynlib: dynlibcpl_error.}]#
proc emergencyError*(a1: cstring) {.stdcall, importc: "CPLEmergencyError",
                                    dynlib: dynlibcpl_error.}
proc errorReset*() {.stdcall, importc: "CPLErrorReset", dynlib: dynlibcpl_error.}
proc getLastErrorNo*(): CPLErrorNum {.stdcall, importc: "CPLGetLastErrorNo",
                                      dynlib: dynlibcpl_error.}
proc getLastErrorType*(): CPLErr {.stdcall, importc: "CPLGetLastErrorType",
                                   dynlib: dynlibcpl_error.}
proc getLastErrorMsg*(): cstring {.stdcall, importc: "CPLGetLastErrorMsg",
                                   dynlib: dynlibcpl_error.}
proc getErrorHandlerUserData*(): pointer {.stdcall,
    importc: "CPLGetErrorHandlerUserData", dynlib: dynlibcpl_error.}
proc errorSetState*(eErrClass: CPLErr; err_no: CPLErrorNum; pszMsg: cstring) {.
    stdcall, importc: "CPLErrorSetState", dynlib: dynlibcpl_error.}
proc cleanupErrorMutex*() {.stdcall, importc: "CPLCleanupErrorMutex",
                             dynlib: dynlibcpl_error.}
type
  CPLErrorHandler* = proc (a1: CPLErr; a2: CPLErrorNum; a3: cstring) {.stdcall.}

proc loggingErrorHandler*(a1: CPLErr; a2: CPLErrorNum; a3: cstring) {.stdcall,
    importc: "CPLLoggingErrorHandler", dynlib: dynlibcpl_error.}
proc defaultErrorHandler*(a1: CPLErr; a2: CPLErrorNum; a3: cstring) {.stdcall,
    importc: "CPLDefaultErrorHandler", dynlib: dynlibcpl_error.}
proc quietErrorHandler*(a1: CPLErr; a2: CPLErrorNum; a3: cstring) {.stdcall,
    importc: "CPLQuietErrorHandler", dynlib: dynlibcpl_error.}
proc turnFailureIntoWarning*(bOn: cint) {.stdcall,
    importc: "CPLTurnFailureIntoWarning", dynlib: dynlibcpl_error.}
proc setErrorHandler*(a1: CPLErrorHandler): CPLErrorHandler {.stdcall,
    importc: "CPLSetErrorHandler", dynlib: dynlibcpl_error.}
proc setErrorHandlerEx*(a1: CPLErrorHandler; a2: pointer): CPLErrorHandler {.
    stdcall, importc: "CPLSetErrorHandlerEx", dynlib: dynlibcpl_error.}
proc pushErrorHandler*(a1: CPLErrorHandler) {.stdcall,
    importc: "CPLPushErrorHandler", dynlib: dynlibcpl_error.}
proc pushErrorHandlerEx*(a1: CPLErrorHandler; a2: pointer) {.stdcall,
    importc: "CPLPushErrorHandlerEx", dynlib: dynlibcpl_error.}
proc setCurrentErrorHandlerCatchDebug*(bCatchDebug: cint) {.stdcall,
    importc: "CPLSetCurrentErrorHandlerCatchDebug", dynlib: dynlibcpl_error.}
proc popErrorHandler*() {.stdcall, importc: "CPLPopErrorHandler",
                           dynlib: dynlibcpl_error.}
proc debug*(a1: cstring; a2: cstring) {.varargs, stdcall, importc: "CPLDebug",
                                      dynlib: dynlibcpl_error.}
#[proc _CPLAssert*(a1: cstring; a2: cstring; a3: cint) {.stdcall, importc: "_CPLAssert",
    dynlib: dynlibcpl_error.}]#