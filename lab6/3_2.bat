@echo off
call %~dp03_1.bat services.txt
net stop dnscache
timeout /t 10
call %~dp03_1.bat services_upd.txt
call %~dp03_3.bat
net start dnscache