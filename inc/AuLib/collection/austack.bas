'AuStack.bi
'12/21/2017

#IFNDEF _AUSTACK_BI_
#DEFINE _AUSTACK_BI_

#include once "crt.bi"

#DEFINE STACKJUMPSIZE 32

nameSpace AuLib
    #MACRO DeclareStack(_T)
    type _T##Stack
        as uinteger allocated, count
        as _T ptr item
        
        declare constructor()
        declare sub allocate()
        declare sub deallocate()
        declare sub push(newItem as _T)
        declare function pop() as _T
        declare function length() as uinteger
    end type
    
    constructor _T##Stack
        item = new _T[STACKJUMPSIZE]
        allocated = STACKJUMPSIZE
    end constructor
    
    sub _T##Stack.allocate()
        allocated+=STACKJUMPSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-STACKJUMPSIZE)*sizeof(_T))
        delete[] item
        item = temp
    end sub
    
    sub _T##Stack.deallocate()
        allocated-=STACKJUMPSIZE
        dim as _T ptr temp = new _T[allocated]
        memmove(temp, item, (allocated-STACKJUMPSIZE)*sizeof(_T))
        delete[] item
        item = temp
    end sub
    
    sub _T##Stack.push(newItem as _T)
        if(count >= allocated) then this.allocate()
        count+=1
        item[count-1] = newItem
    end sub
    
    function _T##Stack.pop() as _T
        if(count = 0) then return 0
        count-=1
        if(count+(STACKJUMPSIZE\2)) < (allocated-STACKJUMPSIZE) then this.deallocate()
        return item[count+1]
    end function
    
    function _T##Stack.length() as uinteger
        return this.count
    end function
    #ENDMACRO
end nameSpace

#ENDIF