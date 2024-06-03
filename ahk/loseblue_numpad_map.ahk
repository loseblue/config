;#NoTrayIcon
;功能列表
; IN SI4
;Numpad0 -> ctrl
;Numpad1 -> copy
;Numpad3 -> paste
;Numpad4 -> go back
;Numpad6 -> go forward
;Numpad5 -> highlight
;Numpad8 -> Lookup References
;Numpad7 -> privous link
;Numpad9 -> next link
;NumpadDot -> End
; IN PDF 

#IfWinActive, ahk_class si4_Frame
Numpad0::Ctrl 
Numpad1:: ^c
Numpad2:: ^s 
Numpad3:: ^v
Numpad4::!,
Numpad5::F8  
Numpad6::!.
Numpad7::+F8
Numpad8::^/ 
Numpad9::+F9
NumpadDot::End

#IfWinActive, ahk_exe understand.exe
Numpad0::Ctrl 
Numpad1:: ^c
; Numpad2:: 
Numpad3:: ^v
Numpad4::!,
Numpad5::!~
Numpad6::!.
Numpad7::+F5
Numpad8::^/ 
Numpad9::+F9
NumpadDot::End

#IfWinActive, ahk_exe klogg_portable.exe
Numpad5::!~

#IfWinActive, ahk_exe PDFXCview.exe
Numpad4::PgUp
Numpad5::RCtrl ;用于goldDict取词
Numpad6::PgDn

#IfWinActive, ahk_exe Notion.exe
Numpad0::Ctrl 
Numpad1:: 
Send {Del}
Send {Space}
Return
NumpadDot::Del

#IfWinActive, ahk_exe Code.exe
Numpad0::Ctrl 
Numpad1:: ^c
Numpad3:: ^v
Numpad4::!Left
Numpad5::F8  
Numpad6::!Right
Numpad7::+F8
Numpad8::^/ 
Numpad9::+F9
NumpadDot::End


#IfWinActive, ahk_exe Obsidian.exe
Numpad9::SupSelection()  ; Surround selection by "<sup>""</sup>"
Numpad8::CenterSelection()  ; Surround selection by "<center>""</center>"
Numpad7::SubSelection()  ; Surround selection by "<sub>""</sub>"
Numpad6::LinkSelectionWithSurround()  ; Surround selection by "[[""]]"
Numpad5::LinkSelection()  ; Surround selection by "[[]]"
Numpad4::LinkSelectionWithDelSurround()  ; Del old Surround and Surround selection by "[[]]"
Numpad3::DelSingleSurround()  ; Del old Surround
Numpad2::CodeSelection()  ; Surround selection by "`"
Numpad1::CodeSelectionWithDelSurround()  ; Del old Surround and Surround selection by "`"
Numpad0::Ctrl 

LinkSelectionWithSurround()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(SurroundLink(selection))  ; SurroundLink the text and paste it back.
}
 
LinkSelection()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(Link(selection))  ; Link the text and paste it back.
}
CodeSelection()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(Code(selection))  ; Code the text and paste it back.
}
 
SubSelection()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(Sub(selection))  ; Code the text and paste it back.
}

CenterSelection()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(Center(selection))  ; Code the text and paste it back.
}
 
 
SupSelection()
{
	selection:= GetSelection()  ; Get selected text.
	PasteText(Sup(selection))  ; Code the text and paste it back.
}

DelSingleSurround()
{
	selection:= GetSelection()  ; Get selected text.
    DelSurround()
	PasteText(selection)  
}

LinkSelectionWithDelSurround()
{
	selection:= GetSelection()  ; Get selected text.
    DelSurround()
	PasteText(Link(selection))  ; Link the text and paste it back.
}

CodeSelectionWithDelSurround()
{
	selection:= GetSelection()  ; Get selected text.
    DelSurround()
	PasteText(Code(selection))  ; Code the text and paste it back.
}

GetSelection(timeoutSeconds:= 0.5)
{
	Clipboard:= ""  ; Clear clipboard for ClipWait to function.
	Send ^c  ; Send Ctrl+C to get selection on clipboard.
	ClipWait %timeoutSeconds% ; Wait for the copied text to arrive at the clipboard.
	return Clipboard
}
DelSurround()
{
    Send {Backspace}
    Send {Backspace}
} 
PasteText(s)
{
	Clipboard:=s  ; Put the text on the clipboard.
	Send ^v  ; Paste the text with Ctrl+V.
}

SurroundLink(s)
{
	return "[[""" . s . """]]"
}
 
Link(s)
{
	return "[[" . s . "]]"
}

Code(s)
{
	return "``" . s . "``"
}

Sub(s)
{
	return "<sub>" . s . "</sub>"
}

Center(s)
{
	return "<center>" . s . "</center>"
}

Sup(s)
{
	return "<sup>" . s . "</sup>"
}
