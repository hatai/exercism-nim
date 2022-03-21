import strutils, sequtils

const
    alphabets = {'a'..'z'}

proc isIsogram*(input : string) : bool =
    let filtered = input.map(toLowerAscii).filter(isLowerAscii)
    return filtered.len == filtered.deduplicate().len
    