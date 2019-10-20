import os, strutils
import regex

let baseDir = currentSourcePath.parentDir()
let filename = baseDir/"wrap/fixture.nim"

proc rmprefixAndLowercase(m: RegexMatch, s: string): string =
  let g1 =  s[m.group(1)[0]]
  result = s[m.group(0)[0]] & toLowerAscii(g1[0]) & substr(g1, 1)

var f = open(filename, fmRead)
# var content = readFile(filename)
var content = f.readAll()
# echo content
echo filename
let r = content.replace(re"""(proc )OGR_DS_(.*)""", rmprefixAndLowercase)
echo r

f.close()


