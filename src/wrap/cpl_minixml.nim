#import wrap/raw/cpl_port
when defined(Windows):
  const dynlibcpl_minixml = "libgdal.dll"

when defined(Linux):
  const dynlibcpl_minixml = "libgdal.so"

when defined(MacOSX):
  const dynlibcpl_minixml = "libgdal.dylib"

import strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "/gdal/gcore\"".}
{.passC: "-I\"" & sourcePath & "/gdal/port\"".}
{.passC: "-I\"" & sourcePath & "/gdal/ogr\"".}
type
  CPLXMLNodeType* {.size: sizeof(cint).} = enum
    CXT_Element = 0, CXT_Text = 1, CXT_Attribute = 2, CXT_Comment = 3, CXT_Literal = 4


type
  CPLXMLNode* {.bycopy.} = object
    eType*: CPLXMLNodeType
    pszValue*: cstring
    psNext*: ptr CPLXMLNode
    psChild*: ptr CPLXMLNode


proc parseXMLString*(a1: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLParseXMLString", dynlib: dynlibcpl_minixml.}
proc destroyXMLNode*(a1: ptr CPLXMLNode) {.stdcall, importc: "CPLDestroyXMLNode",
    dynlib: dynlibcpl_minixml.}
proc getXMLNode*(poRoot: ptr CPLXMLNode; pszPath: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLGetXMLNode", dynlib: dynlibcpl_minixml.}
proc searchXMLNode*(poRoot: ptr CPLXMLNode; pszTarget: cstring): ptr CPLXMLNode {.
    stdcall, importc: "CPLSearchXMLNode", dynlib: dynlibcpl_minixml.}
proc getXMLValue*(poRoot: ptr CPLXMLNode; pszPath: cstring; pszDefault: cstring): cstring {.
    stdcall, importc: "CPLGetXMLValue", dynlib: dynlibcpl_minixml.}
proc createXMLNode*(poParent: ptr CPLXMLNode; eType: CPLXMLNodeType;
                      pszText: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLCreateXMLNode", dynlib: dynlibcpl_minixml.}
proc serializeXMLTree*(psNode: ptr CPLXMLNode): cstring {.stdcall,
    importc: "CPLSerializeXMLTree", dynlib: dynlibcpl_minixml.}
proc addXMLChild*(psParent: ptr CPLXMLNode; psChild: ptr CPLXMLNode) {.stdcall,
    importc: "CPLAddXMLChild", dynlib: dynlibcpl_minixml.}
proc removeXMLChild*(psParent: ptr CPLXMLNode; psChild: ptr CPLXMLNode): cint {.
    stdcall, importc: "CPLRemoveXMLChild", dynlib: dynlibcpl_minixml.}
proc addXMLSibling*(psOlderSibling: ptr CPLXMLNode; psNewSibling: ptr CPLXMLNode) {.
    stdcall, importc: "CPLAddXMLSibling", dynlib: dynlibcpl_minixml.}
proc createXMLElementAndValue*(psParent: ptr CPLXMLNode; pszName: cstring;
                                 pszValue: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLCreateXMLElementAndValue", dynlib: dynlibcpl_minixml.}
proc addXMLAttributeAndValue*(psParent: ptr CPLXMLNode; pszName: cstring;
                                pszValue: cstring) {.stdcall,
    importc: "CPLAddXMLAttributeAndValue", dynlib: dynlibcpl_minixml.}
proc cloneXMLTree*(psTree: ptr CPLXMLNode): ptr CPLXMLNode {.stdcall,
    importc: "CPLCloneXMLTree", dynlib: dynlibcpl_minixml.}
proc setXMLValue*(psRoot: ptr CPLXMLNode; pszPath: cstring; pszValue: cstring): cint {.
    stdcall, importc: "CPLSetXMLValue", dynlib: dynlibcpl_minixml.}
proc stripXMLNamespace*(psRoot: ptr CPLXMLNode; pszNameSpace: cstring;
                          bRecurse: cint) {.stdcall,
    importc: "CPLStripXMLNamespace", dynlib: dynlibcpl_minixml.}
proc cleanXMLElementName*(a1: cstring) {.stdcall,
    importc: "CPLCleanXMLElementName", dynlib: dynlibcpl_minixml.}
proc parseXMLFile*(pszFilename: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLParseXMLFile", dynlib: dynlibcpl_minixml.}
proc serializeXMLTreeToFile*(psTree: ptr CPLXMLNode; pszFilename: cstring): cint {.
    stdcall, importc: "CPLSerializeXMLTreeToFile", dynlib: dynlibcpl_minixml.}