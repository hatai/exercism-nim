import algorithm, sequtils, strutils

func detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
    let sortedWord = word.toLowerAscii.sortedByIt(it)
    candidates.filter(
        proc (candidate: string): bool =
            let lowerCandidate = candidate.toLowerAscii
            lowerCandidate != word.toLowerAscii and lowerCandidate.sortedByIt(it) == sortedWord
    )
