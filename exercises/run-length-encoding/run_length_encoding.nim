import strutils, parseutils

proc toString(count : int, c: char) : string =
    var output :string = ""
    if count notin {0, 1}:
        output.add(count)
    output.add(c)
    return output

proc encode*(input : string) : string =
    if input == "":
        return ""

    var output : string
    var lastC : char = input[0]
    var count = 0
    for c in input:
        if c == lastC:
            inc(count)
        else:
            output.add(toString(count, lastC))

            lastC = c
            count = 1

    output.add(toString(count, lastC))
    return output

proc getCount(input :string) : int =
    var count : string
    for c in input:
        if c.isAlphaAscii or c.isSpaceAscii:
            break
        count.add(c)

    if count == "":
        return 1

    return parseInt(count)


proc decode*(input : string) : string = 
    if input == "":
        return ""
    
    var output: string
    var count = 1
    for i in 0..<input.len:
        let c = input[i]
        if i == 0:
            count = getCount(input.substr(i))
            if count == 1:
                output.add(c)

        elif c.isAlphaAscii or c.isSpaceAscii:
            for j in 0..<count:
                output.add(c)

            count = getCount(input.substr(i + 1))

    return output