@echo off&color 2f&Title Tool Optimize Ram Ver 2.0 By DucNghia&mode 80,20

:main
echo.
echo      ��������������������������������������������������������������������ͻ
echo      �                     Optimize tool Ram Ver 2.0                      �
echo      �                                                                    �
echo      �                Coded by DUCNGHIA ^& Rebuild by Khang-KTN            �
echo      �     __________________________________________________________     �
echo.     �                                                                    �
echo      �                         Do you want install?                       �
echo      �                                                                    �
echo      ��������������������������������������������������������������������ͼ
echo.
choice /c yn /m "Let Choice" 

if %errorlevel% == 1 goto y
if %errorlevel% == 2 goto n


:y
COPY "Files\*.*" "%temp%\*.*"
start Files\project.bat
goto exit

:n
timeout /t 3 /nobreak>nul
goto exit

:exit
exit
