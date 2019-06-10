@echo off&color 30
Title TURN OFF SOME SERVICES _ ^|Coded By Khang-KTN^|
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

echo CreateObject("SAPI.SpVoice").Speak"Your Option" >> %temp%\ktn.vbs
echo CreateObject("SAPI.SpVoice").Speak"Option one or two or three" >> %temp%\ktn.vbs
start %temp%\ktn.vbs

echo.         
echo ฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐ TURN OFF SOME SERVICES ฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐฐ
echo                                    - Coded By Khang-KTN -
echo.                      
ECHO                          FB: https://www.facebook.com/ktn.khang.758      
echo.                       อออออออออออออออออออออออออออออออออออออออออออออ

echo.
echo   [ 1 ]. Press "1" to Tweak Safe ( Recommend )
echo   [ 2 ]. Press "2" to Tweak Extreme ( Turn off Windows Defender ^& Update )
echo   [ 3 ]. Press "3" to Restore Default
echo.


choice /c 123 /n /m "Your Option [1,2,3]? " 

if %errorlevel% == 1 goto safe
if %errorlevel% == 2 goto extreme 
if %errorlevel% == 3 goto default 

:/*************************************************************************/

:extreme 
systeminfo | findstr "OS Name" | find "Windows 7">nul
if %errorlevel% == 0 (

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


echo [ SSDP Discovery ]
net stop SSDPSRV
sc config SSDPSRV start= demand


echo [ Remote Access Connection Manager ]
net stop RasMan
sc config RasMan start= demand


echo [ IKE and AuthIP IPsec Keying Modules ]
net stop IKEEXT
sc config IKEEXT start= demand


echo [ Offline Files ]
net stop CscService
sc config CscService start= demand


echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= disabled


echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= disabled


echo [ Print Spooler ]
net stop spooler
sc config spooler start= demand


echo [ Google update ]
net stop gupdate
sc config gupdate start= demand


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


echo [ Windows Firewall ]
sc config MpsSvc start= disabled
net stop MpsSvc

echo [ Windows Installer ]
net stop msiserver
sc config msiserver start= demand


echo [ Windows Modules Installer ]
net stop TrustedInstaller
sc config TrustedInstaller start= demand


echo [ Windows Font Cache Service ]
net stop FontCache
sc config FontCache start= demand


echo [ Windows Defender Win7 ]
net stop WinDefend
sc config WinDefend start= disabled


echo [ Superfetch ]
net start SysMain 
sc config SysMain start= auto


echo [ Windows Search ]
net stop WSearch
sc config WSearch start= disabled


echo [ Security Center Windows 7 ]
net stop wscsvc
sc config wscsvc start= disabled


echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= disabled



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

echo [ CNG Key Isolation ]
sc config KeyIso start= demand

echo [ Themes ]
net start Themes
sc config Themes start= auto
goto exit 

) else (

echo [ Sensor Service ]
net stop SensorService
sc config SensorService start= demand

echo [ Delivery Optimization ]
sc config DoSvc start= disabled
net stop DoSvc

echo [ Security Center Win10 ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f


echo [ Storage Service ]
net stop StorSvc
sc config StorSvc start= demand


echo [ dmwappushsvc ]
net stop dmwappushservice
sc config dmwappushservice start= demand


echo [ Update Orchestrator Service ]
net stop UsoSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "4" /f


echo [ SecurityHealthService ]
net stop SecurityHealthService
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f


echo [ Windows Defender 10 ]
net stop WinDefend
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f


echo [ Connected User Experiences and Telemetry ]
net stop DiagTrack
sc config DiagTrack start= demand


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


echo [ SSDP Discovery ]
net stop SSDPSRV
sc config SSDPSRV start= demand


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


echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= disabled


echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= disabled


echo  [ Print Spooler ]
net stop spooler
sc config spooler start= demand


echo [ Google Update ]
net stop gupdate
sc config gupdate start= demand


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
net start SysMain 
sc config SysMain start= auto


echo [ Windows Search ]
net stop WSearch
sc config WSearch start= disabled


echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= disabled



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


echo [ CNG Key Isolation ]
net stop KeyIso
sc config KeyIso start= demand

echo [ Themes ]
net stop Themes
sc config Themes start= disabled
goto exit
)

:/::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::/

:safe 

systeminfo | findstr "OS Name" | find "Windows 7">nul
if %errorlevel% == 0 (

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


echo [ SSDP Discovery ]
net stop SSDPSRV
sc config SSDPSRV start= demand 


echo [ Remote Access Connection Manager ]
net stop RasMan
sc config RasMan start= demand


echo [ IKE and AuthIP IPsec Keying Modules ]
net stop IKEEXT
sc config IKEEXT start= demand 


echo [ Offline Files ]
net stop CscService
sc config CscService start= demand 


echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= demand 


echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= demand 


echo [ Print Spooler ]
net stop spooler
sc config spooler start= demand


echo [ Google update ]
net stop gupdate
sc config gupdate start= demand 


echo [ Diagnostic Policy Service ]
net stop DPS
sc config DPS start= demand


echo [ IPHelper ]
net stop iphlpsvc
sc config iphlpsvc start= disabled


echo [ Secondary Logon ]
net stop seclogon
sc config seclogon start= demand 


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
sc config FontCache start= disabled


echo [ Superfetch ]
net start SysMain 
sc config SysMain start= auto


echo [ Windows Search ] 
net stop WSearch
sc config WSearch start= disabled



echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= demand 

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

echo [ CNG Key Isolation ]
sc config KeyIso start= demand

echo [ Themes ]
net start Themes
sc config Themes start= auto
goto exit  

) else (

echo [ Sensor Service ]
net stop SensorService
sc config SensorService start= demand 

echo [ Delivery Optimization ]
net stop DoSvc
sc config DoSvc start= demand 


echo [ Storage Service ]
net stop StorSvc
sc config StorSvc start= demand 


echo [ dmwappushsvc ]
net stop dmwappushservice
sc config dmwappushservice start= demand 



echo [ Connected User Experiences and Telemetry ]
net stop DiagTrack
sc config DiagTrack start= demand 


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
sc config TabletInputService start= demand 


echo [ SSDP Discovery ]
net stop SSDPSRV
sc config SSDPSRV start= demand 


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


echo [ Background Intelligent Transfer ]
net stop bits
sc config bits start= demand 


echo [ Distributed Link Tracking Client ]
net stop TrkWks
sc config TrkWks start= disabled


echo [ Print Spooler ]
net stop spooler
sc config spooler start= demand


echo [ Google Update ]
net stop gupdate
sc config gupdate start= demand 


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
net start SysMain 
sc config SysMain start= auto


echo [ Windows Search ]
net stop WSearch
sc config WSearch start= disabled


echo [ Windows Update ]
net stop wuauserv
sc config wuauserv start= demand



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


echo [ CNG Key Isolation ]
sc config KeyIso start= demand 

echo [ Themes ]
net stop Themes
sc config Themes start= disabled
goto exit
)

:/::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::/

:default 
systeminfo | findstr "OS Name" | find "Windows 7">nul
if %errorlevel% == 0 (

ECHO [ Quality Windows Audio Video Experience ]
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


echo [ Offline Files ]
net start CscService
sc config CscService start= auto 


echo [ Background Intelligent Transfer ]
sc config bits start= auto 


echo [ Distributed Link Tracking Client ]
sc config TrkWks start= auto 


echo [ Print Spooler ]
net start spooler
sc config spooler start= auto


echo [ Google Update ]
net start gupdate
sc config gupdate start= demand


echo [ Diagnostic Policy Service ]
net start DPS
sc config DPS start= demand


echo [ IPHelper ]
net start iphlpsvc
sc config iphlpsvc start= demand 


echo [ Secondary Logon ]
net start seclogon
sc config seclogon start= auto 


echo [ Themes ]
sc config Themes start= auto


echo [ Windows Error Reporting Service ]
net start WerSvc
sc config WerSvc start= demand 


echo [ Windows Firewall ]
net start MpsSvc
sc config MpsSvc start= auto


echo [ Windows Installer ]
sc config msiserver start= demand


echo [ Windows Modules Installer ]
sc config TrustedInstaller start= demand


echo [ Windows Font Cache Service ]
sc config FontCache start= demand


echo [ Windows Defender Win7 ]
net start WinDefend
sc config WinDefend start= auto 


echo [ Superfetch ]
net start SysMain 
sc config SysMain start= auto


echo [ Windows Search ]
net start WSearch
sc config WSearch start= auto 


echo [ Security Center Windows 7 ]
net start wscsvc
sc config wscsvc start= auto 

echo [ Windows Update ]
net start wuauserv
sc config wuauserv start= demand 


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

echo [ CNG Key Isolation ]
net start KeyIso
sc config KeyIso start= auto

echo [ Themes ]
net start Themes
sc config Themes start= auto
goto exit 

) else (

echo [ Sensor Service ]
net start SensorService
sc config SensorService start= auto 

echo [ Delivery Optimization ]
net start DoSvc
sc config DoSvc start= demand 


echo [ Security Center Win10 ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f


echo [ Storage Service ] 
net start StorSvc
sc config StorSvc start= demand 


echo [ dmwappushsvc ]
net start dmwappushservice
sc config dmwappushservice start= auto

echo [ Update Orchestrator Service ]
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "2" /f


echo [ SecurityHealthService ]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "2" /f


echo [ Windows Defender 10 ]
Reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "2" /f


echo [ Connected User Experiences and Telemetry ]
net start DiagTrack
sc config DiagTrack start= auto


ECHO [ Quality Windows Audio Video Experience ]
net start QWAVE
sc config QWAVE start= demand


echo [ IPsec Policy Agent ]
net start PolicyAgent
sc config PolicyAgent start= auto 


echo [ Program Compatibility Assistant Service ]
net start PcaSvc
sc config PcaSvc start= auto


echo [ Windows Connect Now - Config Registrar ]
net start wcncsvc
sc config wcncsvc start= demand



echo [ Touch Keyboard and Handwriting Panel Service ]
net start TabletInputService
sc config TabletInputService start= auto


echo [ SSDP Discovery ]
net start SSDPSRV
sc config SSDPSRV start= demand


echo [ Remote Access Connection Manager ]
net start RasMan
sc config RasMan start= auto


echo [ Geolocation Service ]
net start lfsvc
sc config lfsvc start= auto


echo [ Downloaded Maps Manager ]
net start MapsBroker
sc config MapsBroker start= auto


echo [ IKE and AuthIP IPsec Keying Modules ]
net start IKEEXT
sc config IKEEXT start= auto


echo [ Time Broker ]
sc config TimeBroker start= demand


echo [ Offline Files ]
net start CscService
sc config CscService start= auto


echo [ Background Intelligent Transfer ]
net start bits
sc config bits start= demand


echo [ Distributed Link Tracking Client ]
net start TrkWks
sc config TrkWks start= auto

echo [ Print Spooler ]
net start spooler
sc config spooler start= auto


echo [ Google Update ]
net start gupdate
sc config gupdate start= auto


echo [ Diagnostic Policy Service ]
net start DPS
sc config DPS start= demand


echo [ IPHelper ]
net start iphlpsvc
sc config iphlpsvc start= demand 


echo [ Secondary Logon ]
net start seclogon
sc config seclogon start= auto 


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
net start SysMain 
sc config SysMain start= auto

echo [ Windows Search ]
net start WSearch
sc config WSearch start= auto 


echo [ Windows Update ]
net start wuauserv
sc config wuauserv start= demand 


echo [ Windows Time ]
net start W32Time
sc config W32Time start= demand	


echo [ TCP/IP NetBIOS Helper ]
net start lmhosts
sc config lmhosts start= demand


echo [ Computer Browser ]
sc config Browser start= demand  
	

echo [ Workstation ]
sc config LanmanWorkstation start= demand


echo [ Server ]
sc config LanmanServer start= demand


echo [ CNG Key Isolation ]
net start KeyIso
sc config KeyIso start= auto 

echo [ Themes ]
sc config Themes start= auto 
goto exit
)

:exit 
cls 
del /q %temp%\ktn.vbs
echo         ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo         บ                                                               บ
echo         บ                    Thanks is use Tools                        บ
echo         บ                                                               บ
echo         ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ

timeout 5 /nobreak
exit 