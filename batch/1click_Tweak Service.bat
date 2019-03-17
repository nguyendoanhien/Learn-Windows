@echo off&color fd
Title TWEAK SERVICES _ Created by Khang KTN
MODE 90,30

:admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
CLS
echo           _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
echo.         :                                                                       :
echo          :                         TURN OFF SOME SERVICES                        :
echo          :                                                                       :
echo          :                            - By Khang KTN -                           :
echo.         :                                                                       :
ECHO          :                FB: https://www.facebook.com/ktn.khang.111             :
echo.         :_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _:
echo.   ษอป
echo.   บ1บ Press 1: Tweak 
echo.   ศอผ
echo.   ษอป
echo.   บ2บ Press 2: Restore 
echo.   ศอผ
echo.
echo _____________________
choice /c 123 /n /m ">> Let choice {1;2;}? " 

if %errorlevel% == 1 goto tweak
if %errorlevel% == 2 goto default 
 
::/*************************************************************************/

:tweak
title  Tweaking...! Please wait...
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Caption /format:LIST"')do (set NameOS=%%a) >nul 2>&1
echo %NameOS% | findstr "1">nul
if %errorlevel% == 0 ( goto w10
) else ( goto w7 )

:w7
ECHO [ Quality Windows Audio Video Experience ]
net stop QWAVE
sc config QWAVE start= demand

echo [ IPsec Policy Agent ]
net stop PolicyAgent
sc config PolicyAgent start= demand

echo [ Program Compatibility Assistant Service ]
net stop PcaSvc
sc config PcaSvc start= disabled

echo [ Windows Connect Now - Config Registrar ]
net stop wcncsvc
sc config wcncsvc start= demand

echo [ Remote Access Connection Manager ]
net stop RasMan
sc config RasMan start= demand

echo [ IKE and AuthIP IPsec Keying Modules ]
net stop IKEEXT
sc config IKEEXT start= demand

echo [ Offline Files ]
net stop CscService
sc config CscService start= demand

echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= disabled

echo [ Google Update ]
net stop gupdate
net stop gupdatem
sc config gupdate start= demand 
sc config gupdatem start= demand

echo [ Diagnostic Policy Service ]
sc config DPS start= demand
net stop DPS

echo [ IPHelper ]
net stop iphlpsvc
sc config iphlpsvc start= disabled

echo [ Secondary Logon ]
net stop seclogon
sc config seclogon start= disabled

echo [ Themes ]
sc config Themes start= auto

echo [ Windows Error Reporting Service ]
net stop WerSvc
sc config WerSvc start= disabled

echo [ Windows Installer ]
net stop msiserver
sc config msiserver start= demand


echo [ Windows Modules Installer ]
net stop TrustedInstaller
sc config TrustedInstaller start= demand


echo [ Windows Font Cache Service ]
net stop FontCache
sc config FontCache start= demand


echo [ Superfetch ]
net stop SysMain 
sc config SysMain start= demand


echo [ Windows Search ]
net stop WSearch
sc config WSearch start= disabled


echo [ Security Center Windows 7 ]
net stop wscsvc
sc config wscsvc start= disabled


echo [ Windows Time ]
net stop W32Time
sc config W32Time start= demand	


echo [ TCP/IP NetBIOS Helper ]
net stop lmhosts
sc config lmhosts start= demand


echo [ Computer Browser ]
net stop Browser
sc config Browser start= disabled
	

echo [ Workstation ]
net stop LanmanWorkstation
sc config LanmanWorkstation start= demand


echo [ Server ]
net stop LanmanServer
sc config LanmanServer start= demand

echo [ Microsoft .NET Framework NGEN v2.0.50727_X64 ] 
net stop clr_optimization_v2.0.50727_64
sc config clr_optimization_v2.0.50727_64 start= demand


echo [ Microsoft .NET Framework NGEN v2.0.50727_X86 ]
net stop clr_optimization_v2.0.50727_32
sc config clr_optimization_v2.0.50727_32 start= demand

echo [ Microsoft .NET Framework NGEN v4.0.30319_X64 ]
net stop clr_optimization_v4.0.30319_64
sc config clr_optimization_v4.0.30319_64 start= demand


echo [ Microsoft .NET Framework NGEN v4.0.30319_X86 ]
net stop clr_optimization_v4.0.30319_32
sc config clr_optimization_v4.0.30319_32 start= demand

echo [ Themes ]
net start Themes
sc config Themes start= auto 

color 47&cls
choice /c YN /m "Do you want to turn off the printer ?"
if %errorlevel% == 1 ( 
echo [ Print Spooler ]
net stop spooler
sc config spooler start= disabled
) else ( goto a1 )

:a1
cls
choice /c YN /m "Do you want to turn off Windows Defender ?"
if %errorlevel% == 1 (

echo [ Windows Firewall ]
sc config MpsSvc start= disabled
net stop MpsSvc

echo [ Windows Defender Win7 ]
net stop WinDefend
sc config WinDefend start= disabled

) else ( goto b1 )

:b1
cls
choice /c YN /m "Do you want to turn off UPDATE ?"
if %errorlevel% == 1 (

echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= disabled

echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= disabled
goto exit
) else ( goto exit )

:w10
echo [ Sensor Service ]
net stop SensorService
sc config SensorService start= demand

echo [ Delivery Optimization ]
sc config DoSvc start= disabled
net stop DoSvc

echo [ Storage Service ]
net stop StorSvc
sc config StorSvc start= demand

echo [ Connected User Experiences and Telemetry ]
net stop DiagTrack
sc config DiagTrack start= disabled


ECHO [ Quality Windows Audio Video Experience ]
net stop QWAVE
sc config QWAVE start= demand


echo [ IPsec Policy Agent ]
net stop PolicyAgent
sc config PolicyAgent start= demand

echo [ Program Compatibility Assistant Service ]
net stop PcaSvc
sc config PcaSvc start= demand

echo [ Windows Connect Now - Config Registrar ]
net stop wcncsvc
sc config wcncsvc start= demand

echo [ Touch Keyboard and Handwriting Panel Service ]
net stop TabletInputService
sc config TabletInputService start= disabled

echo [ Remote Access Connection Manager ]
net stop RasMan
sc config RasMan start= demand

echo [ Geolocation Service ]
net stop lfsvc
sc config lfsvc start= demand


echo [ Downloaded Maps Manager ]
net stop MapsBroker
sc config MapsBroker start= demand


echo [ IKE and AuthIP IPsec Keying Modules ]
net stop IKEEXT
sc config IKEEXT start= demand


echo [ Time Broker ]
net stop TimeBroker
sc config TimeBroker start= demand


echo [ Offline Files ]
net stop CscService
sc config CscService start= demand


echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= disabled

echo [ Google Update ]
net stop gupdate
net stop gupdatem
sc config gupdate start= demand 
sc config gupdatem start= demand

echo [ Diagnostic Policy Service ]
net stop DPS
sc config DPS start= demand


echo [ IPHelper ] 
net stop iphlpsvc
sc config iphlpsvc start= disabled

echo [ Secondary Logon ]
net stop seclogon
sc config seclogon start= demand

echo [ Windows Error Reporting Service ]
net stop WerSvc
sc config WerSvc start= disabled

echo [ Windows Installer ]
net stop msiserver
sc config msiserver start= demand

echo [ Windows Modules Installer ]
net stop TrustedInstaller
sc config TrustedInstaller start= demand

echo [ Windows Font Cache Service ]
net stop FontCache
sc config FontCache start= demand

echo [ Superfetch ] 
net stop SysMain 
sc config SysMain start= demand

echo [ Windows Search ]
net stop WSearch
sc config WSearch start= disabled

echo [ Windows Time ]
net stop W32Time
sc config W32Time start= demand	

echo [ TCP/IP NetBIOS Helper ]
net stop lmhosts
sc config lmhosts start= demand

echo [ Computer Browser ]
net stop Browser
sc config Browser start= disabled
	

echo [ Workstation ]
net stop LanmanWorkstation
sc config LanmanWorkstation start= demand

echo [ Server ] 
net stop LanmanServer
sc config LanmanServer start= demand

echo [ Themes ]
net stop Themes
sc config Themes start= disabled

color 47&cls
choice /c YN /m "Do you want to turn off the 'PRINTER' ?"
if %errorlevel% == 1 ( 
echo [ Print Spooler ]
net stop spooler
sc config spooler start= disabled
) else ( goto a2 )

:a2
cls
choice /c YN /m "Do you want to turn off 'WINDOWS DEFENDER' ?"
if %errorlevel% == 1 (

echo [Windows Defender Advanced Threat Protection Service]
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f

echo [Windows Defender Antivirus Network Inspection Service]
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f

echo [ SecurityHealthService ]
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f

echo [Windows Defender Antivirus Service]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f

echo [Windows Defender Firewall]
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "4" /f

echo [ Security Center Win10 ]
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
) else ( goto b2 )

:b2
cls
choice /c YN /m "Do you want to turn off 'UPDATE' ?"
if %errorlevel% == 1 (

echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= disabled

echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= disabled

echo [ dmwappushsvc ]
net stop dmwappushservice
sc config dmwappushservice start= disabled

echo [ Update Orchestrator Service ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f
net stop UsoSvc
goto exit
) else ( goto exit )


::/**********************************************************/

:default 
echo Is Restoring...! Please wait...
for /f "tokens=2 delims==" %%a IN ('"wmic Path Win32_OperatingSystem Get Caption /format:LIST"')do (set NameOS=%%a) >nul 2>&1
echo %NameOS% | findstr "7">nul

if %errorlevel% == 0 (

echo [ Quality Windows Audio Video Experience ]
sc config QWAVE start= demand


echo [ IPsec Policy Agent ]
sc config PolicyAgent start= demand 


echo [ Program Compatibility Assistant Service ]
sc config PcaSvc start= demand


echo [ Windows Connect Now - Config Registrar ]
sc config wcncsvc start= demand


echo [ SSDP Discovery ]
sc config SSDPSRV start= demand 


echo [ Remote Access Connection Manager ]
sc config RasMan start= demand 


echo [ IKE and AuthIP IPsec Keying Modules ]
sc config IKEEXT start= auto 
net start IKEEXT 

echo [ Offline Files ]
sc config CscService start= auto 
net start CscService


echo [ Background Intelligent Transfer ]
sc config bits start= auto 
net start bits 

echo [ Distributed Link Tracking Client ]
sc config TrkWks start= auto 


echo [ Print Spooler ]
sc config spooler start= auto
net start spooler


echo [ Google Update ]
sc config gupdate start= demand
net start gupdate


echo [ Diagnostic Policy Service ]
sc config DPS start= demand
net start DPS


echo [ IPHelper ]
sc config iphlpsvc start= demand 
net start iphlpsvc


echo [ Secondary Logon ]
sc config seclogon start= auto 
net start seclogon


echo [ Themes ]
sc config Themes start= auto


echo [ Windows Error Reporting Service ]
sc config WerSvc start= demand 
net start WerSvc


echo [ Windows Firewall ]
sc config MpsSvc start= auto
net start MpsSvc


echo [ Windows Installer ]
sc config msiserver start= demand


echo [ Windows Modules Installer ]
sc config TrustedInstaller start= demand


echo [ Windows Font Cache Service ]
sc config FontCache start= demand


echo [ Windows Defender Win7 ]
sc config WinDefend start= auto 
net start WinDefend


echo [ Superfetch ]
sc config SysMain start= auto
net start SysMain 


echo [ Windows Search ]
sc config WSearch start= auto 
net start WSearch


echo [ Security Center Windows 7 ]
sc config wscsvc start= auto 
net start wscsvc

echo [ Windows Update ]
sc config wuauserv start= demand 
net start wuauserv


echo [ Windows Time ]
sc config W32Time start= demand	

echo [ TCP/IP NetBIOS Helper ]
sc config lmhosts start= demand


echo [ Computer Browser ]
sc config Browser start= demand 
	

echo [ Workstation ]
sc config LanmanWorkstation start= demand


echo [ Server ]
sc config LanmanServer start= demand


echo [ CNG Key Isolation ]
sc config KeyIso start= auto
net start KeyIso

echo [ Themes ]
sc config Themes start= auto
net start Themes
goto exit 

) else (

echo [ Sensor Service ]
sc config SensorService start= auto 
net start SensorService

echo [ Delivery Optimization ]
sc config DoSvc start= demand 
net start DoSvc


echo [ Security Center Win10 ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f
net start wscsvc 

echo [ Storage Service ] 
sc config StorSvc start= demand 
net start StorSvc

echo [ Windows Defender Firewall ]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "2" /f

echo [ dmwappushsvc ]
sc config dmwappushservice start= auto
net start dmwappushservice

echo [ Update Orchestrator Service ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "2" /f
net start UsoSvc 

echo [ SecurityHealthService ]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "2" /f
Net start SecurityHealthService 

echo [ Windows Defender 10 ]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f
Net start WinDefend 

echo [ Connected User Experiences and Telemetry ]
sc config DiagTrack start= auto
net start DiagTrack


Echo [ Quality Windows Audio Video Experience ]
sc config QWAVE start= demand
net start QWAVE


echo [ IPsec Policy Agent ]
sc config PolicyAgent start= auto 
net start PolicyAgent


echo [ Program Compatibility Assistant Service ]
sc config PcaSvc start= auto
net start PcaSvc


echo [ Windows Connect Now - Config Registrar ]
sc config wcncsvc start= demand
net start wcncsvc


echo [ Touch Keyboard and Handwriting Panel Service ]
sc config TabletInputService start= auto
net start TabletInputService


echo [ SSDP Discovery ]
sc config SSDPSRV start= demand
net start SSDPSRV


echo [ Remote Access Connection Manager ]
sc config RasMan start= auto
net start RasMan


echo [ Geolocation Service ]
sc config lfsvc start= auto
net start lfsvc


echo [ Downloaded Maps Manager ]
sc config MapsBroker start= auto
net start MapsBroker


echo [ IKE and AuthIP IPsec Keying Modules ]
sc config IKEEXT start= auto
net start IKEEXT


echo [ Time Broker ]
sc config TimeBroker start= demand


echo [ Offline Files ]
sc config CscService start= auto
net start CscService


echo [ Background Intelligent Transfer ]
sc config bits start= demand
net start bits


echo [ Distributed Link Tracking Client ]
sc config TrkWks start= auto
net start TrkWks

echo [ Print Spooler ]
net start spooler
sc config spooler start= auto


echo [ Google Update ]
sc config gupdate start= auto
net start gupdate


echo [ Diagnostic Policy Service ]
sc config DPS start= demand
net start DPS


echo [ IPHelper ]
sc config iphlpsvc start= demand 
net start iphlpsvc


echo [ Secondary Logon ]
sc config seclogon start= auto 
net start seclogon


echo [ Windows Error Reporting Service ]
net start WerSvc
sc config WerSvc start= demand

echo [ Windows Installer ]
sc config msiserver start= demand


echo [ Windows Modules Installer ]
sc config TrustedInstaller start= demand


echo [ Windows Font Cache Service ]
sc config FontCache start= demand


echo [ Superfetch ]
sc config SysMain start= auto
net start SysMain 

echo [ Windows Search ]
sc config WSearch start= auto 
net start WSearch


echo [ Windows Update ]
sc config wuauserv start= demand 
net start wuauserv


echo [ Windows Time ]
sc config W32Time start= demand	
net start W32Time


echo [ TCP/IP NetBIOS Helper ]
sc config lmhosts start= demand
net start lmhosts


echo [ Computer Browser ]
sc config Browser start= demand  
	

echo [ Workstation ]
sc config LanmanWorkstation start= demand


echo [ Server ]
sc config LanmanServer start= demand


echo [ CNG Key Isolation ]
sc config KeyIso start= auto 
net start KeyIso


echo [ Themes ]
sc config Themes start= auto 
net start Themes 
goto exit
)

:exit 
cls 
echo             ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo             บ                                                               บ
echo             บ                    Thanks you is use Tool!                    บ
echo             บ                                                               บ
echo             ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

timeout 5 /nobreak
exit 
