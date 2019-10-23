import os, strutils
import regex

let baseDir = currentSourcePath.parentDir()
echo baseDir
let inputfiles = [
  baseDir/"wrap/raw/ogr_api.nim",
  baseDir/"wrap/raw/ogr_core.nim",
  baseDir/"wrap/raw/cpl_port.nim",
  baseDir/"wrap/raw/cpl_progress.nim",
  baseDir/"wrap/raw/cpl_minixml.nim",
]

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

for filename in inputfiles:
  # var file = open(filename)
  # var content = file.readAll()
  var content = readFile(filename)
  for prefix in replacePerfixes:
    let rexp = """proc (""" & prefix & """)(.*)\*(.*)"""
    content = content.replace(re(rexp), rmperfixAndLowercase)
  # file.close()

  let outputfile = filename.replace(re"""(.*/)raw/(.*)""", "$1$2")
  # file = open(outputfile, fmWrite)
  # file.write(content)
  # file.close()
  writeFile(outputfile, content)
