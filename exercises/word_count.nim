import tables, strutils, sequtils

proc countWords*(str: string): CountTableRef[string] =
    result = newCountTable[string]()
    var parsed = str.toLower.split(AllChars - Letters - Digits - {'\''}).filterIt(it.len > 0)
    for item in parsed:
        result.inc(item.strip(chars = {'\''}))
        