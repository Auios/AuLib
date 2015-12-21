'AuWnd.bi (Auios Window)

#ifndef __AUIOS_WINDOW__
#define __AUIOS_WINDOW__
    'include "math.bi"
    #include "crt.bi"
    #include "fbgfx.bi"
    
    #inclib "auwnd"

    namespace Auios
        type AuWindow
                as long w,h
                as long depth
                as long pages
                as long flags
                as long bpp
                as long pitch
                as long rate
                as ubyte visible
                as zstring*48 driver
                as zstring*48 title
                as any ptr buffer
        end type
        
        declare function AuWindowSet(w as long = 800, h as long = 600, depth as long = 32, pages as long = 1, flags as long = 0, title as zstring*32 = "Application") as AuWindow
        declare function AuWindowGetSize(thisWnd as AuWindow, byref w as long, byref h as long) as integer
        declare function AuWindowCreate(thisWnd as AuWindow) as integer
        
        declare function AuWindowHide(thisWnd as AuWindow) as integer
        declare function AuWindowDestroy(thisWnd as AuWindow) as integer
        declare function AuWindowDump(thisWnd as AuWindow,message as zstring*32 = "") as integer
        
        declare function AuWindowPrintBar(charVar as zstring*1, cnt as long) as integer
    end namespace
#endif