Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
oShell.CurrentDirectory = "C:\Program Files\TurboVNC"
strArgs = "cmd /c vncviewer-java.bat Toolbar=0 Password=nishant archlinux:1"
oShell.Run strArgs, 0, false
