import strutils, std/wordwrap


proc decode*(input: string): string =
    for c in input.toLower:
        if c.isDigit: result.add(c)
        elif c.isAlphaAscii: result.add(chr(219 - ord(c)))

proc encode*(input: string): string =
    wrapWords(decode(input), maxLineWidth=5, newLine=" ")