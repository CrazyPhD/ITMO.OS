@echo off
echo "%~dp02_2.bat %1"
SCHTASKS /create /tn "LAB6_Copy" /tr "%~dp02_2.bat" /sc ONCE /st %1
::at %1 /INTERACTIVE cmd /C start %~dp02_2.bat :: not working on Windows 10