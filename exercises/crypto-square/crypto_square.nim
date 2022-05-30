import strutils, re, sequtils, strformat


proc encrypt*(input: string): string =
    let input = input.replace(re"\W", "").toLowerAscii
    if input.len < 2:
        return input

    var r, c = 1
    while not (r * c >= input.len and c >= r and c - r <= 1):
        if r == c:
            r += 1
        else:
            c += 1
            
    var chunks = newSeq[seq[char]](r)
    var i = 0
    for chunk in input:
        let n = i mod r
        chunks[n].add(chunk)

        inc(i)
            

    result = chunks
                .mapIt(alignString(it.join(""), chunks[0].len))
                .join(" ")
