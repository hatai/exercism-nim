import strutils, sequtils

type
    CharSet = set[char]

const
    alphabetsLen = {'a'..'z'}.card

proc isPangram*(value: string): bool =
    return value
        .map(toLowerAscii)
        .filter(isLowerAscii)
        .deduplicate()
        .len == alphabetsLen
