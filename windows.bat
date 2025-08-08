@echo off
:options
echo      == Choose an option by putting in the number and pressing Enter ==
echo 1: Regular Shutdown
echo 2: Regular Reboot
echo 3: Logout
echo 4: Reboot Into UEFI Menu (Requires Administrator)
echo 5: Advanced Startup Reboot (Recovery Command Prompt, Safe Mode e.c.t.)
echo Or close this terminal to cancel and exit."
set /p option=Enter option: 
if "%option%"=="1" goto regshutdown
if "%option%"=="Regular Shutdown" goto regshutdown
if "%option%"=="2" goto regreboot
if "%option%"=="Regular Reboot" goto regreboot
if "%option%"=="3" goto logout
if "%option%"=="Logout" goto logout
if "%option%"=="4" goto uefi
if "%option%"=="Reboot Into UEFI Menu" goto uefi
if "%option%"=="5" goto advancestart
if "%option%"=="Advanced Startup Reboot" goto advancestart
cls
echo Invalid input entered, please select a valid option.
goto options
:regshutdown
shutdown /s /t 15
goto selected
:regreboot
shutdown /r /t 15
goto selected
:logout
echo You will be logged out in 15 seconds. To cancel, press any key.
timeout /t 15 >nul
if errorlevel 1 (
    REM do nothing
    else (
    shutdown /l
    )
)
cls
goto options
:uefi
shutdown /r /fw /t 15 /c "Rebooting into UEFI menu..."
goto selected
:advancestart
shutdown /r /o /t 15 /c "Rebooting into Advanced Startup Options"
goto selected
:selected
echo [%date% %time%] Option selected: %option% >>"actions.log"
echo System will shutdown or reboot in 15 seconds. To cancel, press any key.
pause >nul
shutdown /a
echo [%date% %time%] Canceled operation. >>"actions.log"
cls
goto options