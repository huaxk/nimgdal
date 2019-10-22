#import wrap/cpl_port
when defined(Windows):
  const dynlibcpl_progress = "libgdal.dll"

when defined(Linux):
  const dynlibcpl_progress = "libgdal.so"

when defined(MacOSX):
  const dynlibcpl_progress = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
type
  GDALProgressFunc* = proc (dfComplete: cdouble; pszMessage: cstring;
                         pProgressArg: pointer): cint {.stdcall.}

proc GDALDummyProgress*(a1: cdouble; a2: cstring; a3: pointer): cint {.stdcall,
    importc: "GDALDummyProgress", dynlib: dynlibcpl_progress.}
proc GDALTermProgress*(a1: cdouble; a2: cstring; a3: pointer): cint {.stdcall,
    importc: "GDALTermProgress", dynlib: dynlibcpl_progress.}
proc GDALScaledProgress*(a1: cdouble; a2: cstring; a3: pointer): cint {.stdcall,
    importc: "GDALScaledProgress", dynlib: dynlibcpl_progress.}
proc GDALCreateScaledProgress*(a1: cdouble; a2: cdouble; a3: GDALProgressFunc;
                              a4: pointer): pointer {.stdcall,
    importc: "GDALCreateScaledProgress", dynlib: dynlibcpl_progress.}
proc GDALDestroyScaledProgress*(a1: pointer) {.stdcall,
    importc: "GDALDestroyScaledProgress", dynlib: dynlibcpl_progress.}