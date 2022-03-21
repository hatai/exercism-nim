import tables, sequtils

const
    nucleotides = ['A', 'C', 'G', 'T']

func countDna*(dna: string): CountTable[char] = 
    for c in dna:
        if c notin nucleotides:
            raise newException(ValueError, "strand with invalid nucleotides")

    dna.toCountTable
    