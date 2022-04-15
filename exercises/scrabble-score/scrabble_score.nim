import strutils, sequtils


type
    Score = tuple
        letters: string
        point: int


const
    SCORES: array[0..6, Score] = [
        ("AEIOULNRST", 1),
        ("DG", 2),
        ("BCMP", 3),
        ("FHVWY", 4),
        ("K", 5),
        ("JX", 8),
        ("QZ", 10),
    ]


func score*(input: string): int =
    for c in input.toUpperAscii:
        result += SCORES.filterIt(c in it.letters)[0].point
