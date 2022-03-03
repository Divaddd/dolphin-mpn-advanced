@echo off
title Mario Party Netplay Updater Updater
:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :Start
if /I "%c%" EQU "N" goto :Exit
goto :Exit

:Start
TASKKILL /IM "Dolphin-MPN.exe" /F
"Updater/wget.exe" https://github.com/Divaddd/dolphin-mpn-advanced/archive/refs/heads/main.zip
"Updater/7z.exe" x main.zip
cd User\
move Config ..\
move GameSettings ..\
move GC ..\
move GBA ..\
move Load ..\
move Wii ..\
cd ..\
rmdir QtPlugins /s /q
rmdir Sys /s /q
rmdir User /s /q
cd dolphin-mpn-advanced-main
move QtPlugins ..\
move Sys ..\
move User  ..\
move "Dolphin-MPN.exe" ..\
move "DolphinTool.exe" ..\
move "DSPTool.exe" ..\
cd ..\
rmdir dolphin-mpn-advanced-main /s /q
DEL main.zip
rmdir User\Load /s /q
move Config User\
move GameSettings User\
move GC User\
move GBA User\
move Load User\
move Wii User\
start Dolphin-MPN
:Exit
EXIT