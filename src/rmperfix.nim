import os, strutils
import regex

let baseDir = currentSourcePath.parentDir()
let inputfiles = [
  baseDir/"wrap/ogr_api.nim",
  baseDir/"wrap/ogr_core.nim",
  baseDir/"wrap/cpl_progress.nim",
  baseDir/"wrap/cpl_minixml.nim",
]
# let outputfile = baseDir/"wrap/wrap_ogr_api.nim"

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
  "OGR_GT_",
  "OGR_",
  "OGR",
  "GDAL",
  "CPL",
]

let ignoreProcs = [
  # "OGROpen",
  # "OGRGetDriverCount",
  ""
]

proc rmperfixAndLowercase(m: RegexMatch, s: string): string =
  let perfix = s[m.group(0)[0]]
  let newProcName = s[m.group(1)[0]]
  let rawProcName = perfix & newProcName
  if rawProcName in ignoreProcs:
    result = "proc " & perfix.toLowerAscii & newProcName & "*" & s[m.group(2)[0]]
  else:
    result = "proc " & toLowerAscii(newProcName[0]) & substr(newProcName, 1) & "*" & s[m.group(2)[0]]

for file in inputfiles:
  var content = readFile(file)
  for prefix in replacePerfixes:
    let rexp = """proc (""" & prefix & """)(.*)\*(.*)"""
    content = content.replace(re(rexp), rmperfixAndLowercase)

  let outputfile = file.replace(re"""(.*)\/(.*)""", "$1/wrap_$2")
  writeFile(outputfile, content)
