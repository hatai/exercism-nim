import strutils, sequtils

proc hey*(str: string): string =
    var s = str.strip
    if s.len == 0:
        "Fine. Be that way!"
    
    elif s.len == 1:
        "Whatever."

    elif s.allIt(it.isUpperAscii or it.isSpaceAscii):
        "Whoa, chill out!"

    elif s.allIt(it.isUpperAscii or it.isSpaceAscii or it in ['?', '\'']) and (s.endsWith('?') or s.endsWith('!')):
        "Calm down, I know what I'm doing!"
    
    elif s.endsWith('?'):
        "Sure."

    elif s.allIt(not it.isAlphaAscii or it.isSpaceAscii):
        "Whatever."

    elif s == s.toUpperAscii:
        "Whoa, chill out!"
    
    else:
        "Whatever."
