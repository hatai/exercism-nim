import strutils

proc reverse*(input : string) : string = 
    var output: string
    for s in input.rsplit(""): output.add(s)

    return output
