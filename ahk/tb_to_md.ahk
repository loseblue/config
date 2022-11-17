#z::
Run, excel.exe "%A_ScriptDir%\1.xlsx"
WinWait, ahk_class XLMAIN,
IfWinNotActive, ahk_class XLMAIN, , WinActivate, ahk_class XLMAIN,
WinWaitActive, ahk_class XLMAIN,
sleep 50
Send ^{a}
sleep 1000
Send ^{-}
sleep 1000
Send ^{v}
sleep 1000
Send {Enter}
sleep 1000
Send ^{s}
sleep 1000
Send !{F4}

sleep 1000
SetTitleMatchMode 2
dir=D:\MySoftWare\markdown_tools\exceltk.0.1.3
run=exceltk.exe -t md -xls 1.xlsx
run,cmd
WinWait, ahk_class ConsoleWindowClass,
IfWinNotActive, ahk_class ConsoleWindowClass, , WinActivate, ahk_class ConsoleWindowClass,
WinWaitActive, ahk_class ConsoleWindowClass,
ControlSend, , cd /d %A_ScriptDir% {Enter}, cmd.exe
sleep 50
ControlSend, , %run% {Enter}, cmd.exe 
sleep 1000
Send !{F4}

sleep 1000
Run, Notepad "%A_ScriptDir%\1Sheet1.md"
WinWait, ahk_class Notepad,
IfWinNotActive, ahk_class Notepad, , WinActivate, ahk_class Notepad,
WinWaitActive, ahk_class Notepad,
sleep 50
Send ^{a}
sleep 1000
Send ^{c}
sleep 1000
Send !{F4}


return




