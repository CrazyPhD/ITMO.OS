@echo off
sc query type=service | find "Имя_службы"  > %1