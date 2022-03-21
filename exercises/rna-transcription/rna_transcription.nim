import tables, sequtils

const
    t = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}.toTable

proc toRna*(input : string) : string =
    var output: string
    for c in input:
        output.add(t[c])
    return output
