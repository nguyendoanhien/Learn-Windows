@echo off
color 4a&Title Optimize tool Ram Ver 2.0 By DucNghia
mode 80,20
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
cls 
:main

echo.
echo      ��������������������������������������������������������������������ͻ
echo      �                                                                    �
echo      �                     Optimize tool Ram Ver 2.0                      �
echo      �                                                                    �
echo      �                     Do you want to Uninstall?                      �
echo      �                                                                    �
echo      ��������������������������������������������������������������������ͼ
echo.
choice /c yn /m "Your Choice" 

if %errorlevel% == 1 goto y
if %errorlevel% == 2 goto n


:y
DEL /Q /F %windir%\SystemRoot.dll.exe
DEL /Q /F %windir%\RamClean\TimeClean.ini
DEL /Q /F %windir%\RamClean\RAM-AUTO-CLEAN.bat
RD /S /Q  %windir%\RamClean
SCHTASKS /Delete /TN CleanScheduled /F
cls
echo.
echo      ��������������������������������������������������������������������ͻ
echo      �                                                                    �
echo      �                     Optimize tool Ram Ver 2.0                      �
echo      �                                                                    �
echo      �                   Uninstalling, please wait!!!                     �
echo      �                                                                    �
echo      ��������������������������������������������������������������������ͼ
echo.
timeout /t 5 /nobreak>nul
cls
echo.
echo      ��������������������������������������������������������������������ͻ
echo      �                                                                    �
echo      �                      Successfully uninstalled!                     �
echo      �                                                                    �
echo      ��������������������������������������������������������������������ͼ
echo.
timeout /t 3 /nobreak>nul
Exit
:n
timeout /t 3 /nobreak>nul
exit

