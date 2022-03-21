import strutils, sequtils

proc abbreviate*(input: string): string =
    input.split({' ', '-', '_'})
        .filterIt(it.len != 0)
        .mapIt(it[0].toUpperAscii)
        .join
        