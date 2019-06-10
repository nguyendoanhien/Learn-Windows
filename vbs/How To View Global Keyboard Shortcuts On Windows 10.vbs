Const rootdir = "C:\Users"

Set fso = CreateObject("Scripting.FileSystemObject")
Set wshell = CreateObject("WScript.Shell")

logname="GlobalHotkeys.txt"
Set logfile = fso.CreateTextFile(logname,True)
logfile.Write "Searching for shortcuts with hotkeys" & vbCrLf

recursedirs( fso.GetFolder(rootdir) )

logfile.Write "Done searching" & vbCrLf
logfile.Close

Sub recursedirs(dir)
If trylistdir(dir) Then
For Each subdir In dir.SubFolders
recursedirs subdir
Next

For Each file In dir.Files
extn = fso.GetExtensionName(file.Path)
if LCase(extn) = "lnk" Then
check(file.Path)
end if
Next
End If
End Sub

Function trylistdir(dir)
On Error Resume Next
trylistdir = (dir.SubFolders.Count + dir.Files.Count >= 0)
End Function

Sub check(fname)

Set lnk = wshell.CreateShortcut(fname)
hk = lnk.Hotkey
if (hk<>"") then
logfile.Write fname & " : " & hk & vbCrLf
end if

End Sub