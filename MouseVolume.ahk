Volume_OSD := false ;activate or deactivate windows 10 volume overlay
#SingleInstance, force
#NoTrayIcon
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}
wheel = false
XButton1 & WheelUp:: 
wheel := true
if(Volume_OSD) 
	Send {Volume_Up 5}
else
	SoundSet +5
return
XButton1 & WheelDown::
wheel := true
if(Volume_OSD)
	Send {Volume_Down 5}
else
	SoundSet -5
return
XButton1:: ;only send the key if not changing volume
If (A_ThisHotkey != WheelDown && A_ThisHotkey != WheelUp){
	wheel = false
	SendInput, {XButton1}
}
return
