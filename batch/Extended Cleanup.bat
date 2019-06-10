@echo off
color 70
mode 80,35
title Extended Disk Cleanup_Coded By Khang-KTN

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
CLS&echo.&title Processing Cleaning...
echo                           ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
echo                           º                        º
echo                           º  Extended Disk Cleanup º
echo                           º                        º
echo                           ßßßßßßßßßßßßßßßßßßßßßßßßßß       
echo.           
echo.1^> Check all =^> OK
echo.                                         
echo 2^> Note:&echo.
echo    * Don't close windows
echo    * Cleaning time depends on the amount your garbage
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo Openning Extended Disk Cleanup . . .


%SystemRoot%\System32\Cmd.exe /c Cleanmgr /sageset:65535
Cleanmgr /sagerun:65535
cls

echo Cleaning . . .
echo ===============
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
cls&title Finish!
msg * Clean finish! Press OK. Thanks!
echo.
echo                   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo                   °            THANKS YOU IS USE SCRIPT!          °
echo                   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
echo. & pause 