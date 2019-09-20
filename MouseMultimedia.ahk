#NoEnv
#SingleInstance, force
#include DesktopSwitcher.ahk
#NoTrayIcon
SetBatchLines, -1

if not A_IsAdmin
{
    Try{
       Run *RunAs "%A_ScriptFullPath%" ;force admin so hotkeys will work in fullscreen
       ExitApp
    }
    catch c
    {
        
    }
}

Volume_OSD   := true    ;activate or deactivate Windows 10 Volume OSD | might cause FPS drops in fullscreen games
return
;____________________ [Auto Exec END] ____________________  

XButton1 & LButton::
Send {Media_Prev}
return

XButton1 & RButton::
SendInput {Media_Next}
return

XButton1 & MButton::
Send {Media_Play_Pause}
return

XButton1 & WheelUp::
if (Volume_OSD) 
    Send {Volume_Up 2}
else
    SoundSet +5
return

XButton1 & WheelDown::
if(Volume_OSD)
    Send {Volume_Down 2}
else
    SoundSet -5
return

XButton2 & WheelUp:: 
switchDesktopByNumber(CurrentDesktop + 1)
return

XButton2 & WheelDown::
switchDesktopByNumber(CurrentDesktop - 1)
return

;single key -- send native key function 
~WheelDown::
~WheelUp::
~MButton::
~LButton::
~RButton::
return

XButton1::
Send {XButton1}
return

XButton2::
Send {XButton2}
return
