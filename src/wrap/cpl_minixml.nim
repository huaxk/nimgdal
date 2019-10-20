#import wrap/cpl_port
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
  CPLXMLNode* {.bycopy.} = object
    eType*: CPLXMLNodeType
    pszValue*: cstring
    psNext*: ptr CPLXMLNode
    psChild*: ptr CPLXMLNode



proc CPLParseXMLString*(a1: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLParseXMLString", dynlib: dynlibcpl_minixml.}
proc CPLDestroyXMLNode*(a1: ptr CPLXMLNode) {.stdcall, importc: "CPLDestroyXMLNode",
    dynlib: dynlibcpl_minixml.}
proc CPLGetXMLNode*(poRoot: ptr CPLXMLNode; pszPath: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLGetXMLNode", dynlib: dynlibcpl_minixml.}
proc CPLSearchXMLNode*(poRoot: ptr CPLXMLNode; pszTarget: cstring): ptr CPLXMLNode {.
    stdcall, importc: "CPLSearchXMLNode", dynlib: dynlibcpl_minixml.}
proc CPLGetXMLValue*(poRoot: ptr CPLXMLNode; pszPath: cstring; pszDefault: cstring): cstring {.
    stdcall, importc: "CPLGetXMLValue", dynlib: dynlibcpl_minixml.}
proc CPLCreateXMLNode*(poParent: ptr CPLXMLNode; eType: CPLXMLNodeType;
                      pszText: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLCreateXMLNode", dynlib: dynlibcpl_minixml.}
proc CPLSerializeXMLTree*(psNode: ptr CPLXMLNode): cstring {.stdcall,
    importc: "CPLSerializeXMLTree", dynlib: dynlibcpl_minixml.}
proc CPLAddXMLChild*(psParent: ptr CPLXMLNode; psChild: ptr CPLXMLNode) {.stdcall,
    importc: "CPLAddXMLChild", dynlib: dynlibcpl_minixml.}
proc CPLRemoveXMLChild*(psParent: ptr CPLXMLNode; psChild: ptr CPLXMLNode): cint {.
    stdcall, importc: "CPLRemoveXMLChild", dynlib: dynlibcpl_minixml.}
proc CPLAddXMLSibling*(psOlderSibling: ptr CPLXMLNode; psNewSibling: ptr CPLXMLNode) {.
    stdcall, importc: "CPLAddXMLSibling", dynlib: dynlibcpl_minixml.}
proc CPLCreateXMLElementAndValue*(psParent: ptr CPLXMLNode; pszName: cstring;
                                 pszValue: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLCreateXMLElementAndValue", dynlib: dynlibcpl_minixml.}
proc CPLAddXMLAttributeAndValue*(psParent: ptr CPLXMLNode; pszName: cstring;
                                pszValue: cstring) {.stdcall,
    importc: "CPLAddXMLAttributeAndValue", dynlib: dynlibcpl_minixml.}
proc CPLCloneXMLTree*(psTree: ptr CPLXMLNode): ptr CPLXMLNode {.stdcall,
    importc: "CPLCloneXMLTree", dynlib: dynlibcpl_minixml.}
proc CPLSetXMLValue*(psRoot: ptr CPLXMLNode; pszPath: cstring; pszValue: cstring): cint {.
    stdcall, importc: "CPLSetXMLValue", dynlib: dynlibcpl_minixml.}
proc CPLStripXMLNamespace*(psRoot: ptr CPLXMLNode; pszNameSpace: cstring;
                          bRecurse: cint) {.stdcall,
    importc: "CPLStripXMLNamespace", dynlib: dynlibcpl_minixml.}
proc CPLCleanXMLElementName*(a1: cstring) {.stdcall,
    importc: "CPLCleanXMLElementName", dynlib: dynlibcpl_minixml.}
proc CPLParseXMLFile*(pszFilename: cstring): ptr CPLXMLNode {.stdcall,
    importc: "CPLParseXMLFile", dynlib: dynlibcpl_minixml.}
proc CPLSerializeXMLTreeToFile*(psTree: ptr CPLXMLNode; pszFilename: cstring): cint {.
    stdcall, importc: "CPLSerializeXMLTreeToFile", dynlib: dynlibcpl_minixml.}