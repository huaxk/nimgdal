import os, strutils
import regex

let baseDir = currentSourcePath.parentDir()
let filename = baseDir/"wrap/fixture.nim"

let ignoreProcs = [
  "OGROpen",
  "OGRGetDriverCount"
]

proc rmperfixAndLowercase(m: RegexMatch, s: string): string =
  let perfix = s[m.group(0)[0]]
  let newProcName = s[m.group(1)[0]]
  let rawProcName = perfix & newProcName
  if rawProcName in ignoreProcs:
    result = "proc " & rawProcName & "*" & s[m.group(2)[0]]
  else:
    result = "proc " & toLowerAscii(newProcName[0]) & substr(newProcName, 1) & "*" & s[m.group(2)[0]]

var content = readFile(filename)
content = content.replace(re"""proc (OGR_DS_)(.*)\*(.*)""", rmperfixAndLowercase)
                 .replace(re"""proc (OGR_L_)(.*)\*(.*)""", rmperfixAndLowercase)
                 .replace(re"""proc (OGR_Dr_)(.*)\*(.*)""", rmperfixAndLowercase)
                 .replace(re"""proc (OGR)(.*)\*(.*)""", rmperfixAndLowercase)
echo content
