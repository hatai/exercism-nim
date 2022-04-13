const 
    starts = ['(', '{', '[']

        
proc isPaired*(v: string): bool =
    var results = newSeq[char]()
    for elem in v:
        case elem:
            of '(': results.add ')'
            of '{': results.add '}'
            of '[': results.add ']'
            of ')', '}', ']':
                if results.len == 0 or results.pop() != elem:
                    return false
            else:
                discard

    results.len == 0
