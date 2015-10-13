'Test1

'define fbc -p .\lib\

#include "crt.bi"
#include "fbgfx.bi"
#include "auios\auios.bi"

using Auios

'Variables
dim shared as integer i = 0
dim shared as AuWindow myWnd 'Could use myWnd = AuWndInit(2,"MyWindowTitle")
dim as AuMouse ms,msOld
dim as AuGUI GUI(1 to 1)

'Declares
declare sub keyboard()
declare sub clearScreen()

'Init
'myWnd = AuWindowInit(3,"MyWindowTitle")
myWnd = AuWindowInit(2,"MyWindowTitle")
GUI(1) = AuGUIInit(200,200,200,150,"Test")
'Create the window
'AuWndCreate(AuWndInit())
AuWindowCreate(myWnd)
AuGUIOpen(GUI(1))

clearScreen()

do
    msOld = ms
    ms = AuMouseGet()
    'if memcmp(@ms,@msOld,sizeof(ms)) <> 0 then AuMsDump(ms)
    if AuMouseCompare(ms,msOld) <> 0 then AuMouseDump(ms)
    
    keyboard()
    for i = lbound(GUI) to ubound(GUI)
        AuGUIInput(GUI(i),ms)
    next i
    
    screenlock
        for i = lbound(GUI) to ubound(GUI)
            AuGUIRender(GUI(i))
        next i
        if ms.buttons = 1 then
            circle(ms.x,ms.y),15,rgb(200,100,100),,,,f
        end if
    screenunlock
    
    sleep 1,1
loop until inkey = chr(27)

AuWindowDestroy(myWnd)

end 0

sub keyboard()
    if multikey(fb.sc_c) then clearScreen()
end sub

sub clearScreen()
    line(0,0)-(myWnd.w,myWnd.h),rgb(255,0,255),bf
end sub