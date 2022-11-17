#NoTrayIcon
; 功能列表
; Capslock 转换为ESC Shift+Capslock = Capslock
;"滚动当前窗口(不用激活窗口)
; Win+a 置顶当前窗口


; Capslock 转换为ESC 右ctrl+Capslock = Capslock
$CapsLock::Esc
RCtrl & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"

; LWIN 转换为LCTRL
$LWin::LCtrl

; "滚动当前窗口(不用激活窗口)
WheelUp::
WheelDown::
Wheel()
return
Wheel()
{
    CoordMode, Mouse, Screen
    MouseGetPos, MouseX, MouseY
    DllCall("SendMessage","PTR",DllCall( "WindowFromPoint", "INT64", MouseX | (MouseY << 32), "Ptr"),"UInt", 0x20A, "PTR",(120 * (A_ThisHotkey = "WheelUp" ? 1 : -1)) << 16,"PTR", ( MouseY << 16 )|MouseX)
    return
}


; Win+t 置顶当前窗口
#t::
WinGet, transValue, Transparent, A
if (topValue = 1) 
{
    WinSet, AlwaysOnTop, OFF, A
        topValue = 0
} 
else
{
    WinSet, AlwaysOnTop, ON, A
        topValue = 1
}
return
