'AuStringManip.bi
'string.bi
'2018-10-01

#IFNDEF _AULIB_STRING_BI_
#DEFINE _AULIB_STRING_BI_

#include once "crt.bi"

nameSpace AuLib
    function getWord(byval text as string, wordIndex as integer, delimiter as string = " ") as string
        dim as zstring ptr word
        dim as integer wordsPassed
        word = strtok(text, delimiter)
        while(word <> NULL)
            wordsPassed+=1
            if(wordsPassed = wordIndex) then
                exit while
            end if
            word = strtok(NULL, delimiter)
        wend
        return(*word)
    end function
    
    function getWordCount(byval text as string, delimiter as string = " ") as integer
        dim as zstring ptr word
        dim as integer wordsPassed
        word = strtok(text, delimiter)
        while(word <> NULL)
            wordsPassed+=1
            word = strtok(NULL, delimiter)
        wend
        return(wordsPassed)
    end function
    
    sub printBar(charVar as string, charCount as long)
        for printCount as integer = 1 to charCount
            printf(!"%s",charVar)
        next printCount
        printf(!"\n")
    end sub
end nameSpace

#ENDIF