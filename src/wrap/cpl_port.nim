#when defined(Windows):
#  const dynlibcpl_port = "libgdal.dll"
#
#when defined(Linux):
#  const dynlibcpl_port = "libgdal.so"
#
#when defined(MacOSX):
#  const dynlibcpl_port = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
const
#  _LARGEFILE64_SOURCE* = 1
#  __MSVCRT_VERSION__* = 0x00000700
#  _XOPEN_SOURCE* = 600
  HAVE_CXX11* = 1
#  CPL_HAS_GINT64* = 1
  CPL_HAS_GINT64* = 1
#  HAS_CPL_INLINE* = 1
  HAS_CPL_INLINE* = 1
  NULL* = 0
  M_PI* = 3.141592653589793
#  FALSE* = f
  FALSE* = 0
  TRUE* = 1

type
  GInt32* = cint
  GUInt32* = cuint
  GInt16* = cshort
  GUInt16* = cushort
  GByte* = cuchar
  GBool* = cint
  GIntBig* = clonglong
  GUIntBig* = culonglong
  GInt64* = GIntBig
  GUInt64* = GUIntBig
  GPtrDiff_t* = cint
