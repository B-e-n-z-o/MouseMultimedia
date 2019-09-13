function Get-ScriptDirectory {
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

. "c:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in $installpath "MouseMultimedia.ahk"  /out $installpath "MouseMultimedia.exe"

$installpath = Get-ScriptDirectory