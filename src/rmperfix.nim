import os, strutils
import regex

let baseDir = currentSourcePath.parentDir()
let filename = baseDir/"wrap/ogr_api.nim"
let outputfile = baseDir/"ogr_api.nim"

let replacePerfixes = [
  "OGR_DS_",
  "OGR_L_",
  "OGR_F_",
  "OGR_G_",
  "OGR_FD_",
  "OGR_Fld_",
  "OGR_Dr_",
  "OGR_SM_",
  "OGR_ST_",
  "OGR_STBL_",
  "OGR_",
  "OGR",
]

let ignoreProcs = [
  "OGROpen",
  "OGRGetDriverCount"
]

proc rmperfixAndLowercase(m: RegexMatch, s: string): string =
  let perfix = s[m.group(0)[0]]
  let newProcName = s[m.group(1)[0]]
  let rawProcName = perfix & newProcName
  if rawProcName in ignoreProcs:
    result = "proc " & perfix.toLowerAscii & newProcName & "*" & s[m.group(2)[0]]
  else:
    result = "proc " & toLowerAscii(newProcName[0]) & substr(newProcName, 1) & "*" & s[m.group(2)[0]]

var content = readFile(filename)
for prefix in replacePerfixes:
  # let rexp = """proc (""" & prefix & """)(.*)\*\(([\s\S]*?)\):(.*)[\s\S]\{\.([\s\S]*?)\.\}"""
  let rexp = """proc (""" & prefix & """)(.*)\*(.*)"""
  content = content.replace(re(rexp), rmperfixAndLowercase)
  # content = content.replace(re(fmt"""proc ({prefix})(.*)\*(.*)"""),
  #                           rmperfixAndLowercase)

writeFile(outputfile, content)
