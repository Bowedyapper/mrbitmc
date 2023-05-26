@echo off
set target_pid=%1
echo Waiting for Minecraft to close before finalising setup
:LOOP
tasklist /FI "PID eq %target_pid%" 2>NUL | find /I "%target_pid%">NUL
if %ERRORLEVEL% EQU 0 (
    ping 127.0.0.1 -n 1 >NUL
    goto :LOOP
)
REM Deleting the "mods" folder
rd /s /q "mods"
REM Renaming the "modjars" folder to "mods"
ren "modjars" "mods"
del "cleanup.sh"
del "%~f0"
