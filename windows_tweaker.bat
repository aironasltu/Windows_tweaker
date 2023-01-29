@echo off
title Windows tweaker 1.0

:CheckForUpdates
set local=1.0
set localtwo=1.0
if exist "%temp%\Updater.bat" DEL /S /Q /F "%temp%\Updater.bat" >nul 2>&1
curl -g -L -# -o "%temp%\Updater.bat" "https://raw.githubusercontent.com/auraside/HoneCtrl/main/Files/HoneCtrlVer" >nul 2>&1
call "%temp%\Updater.bat"
IF "%local%" gtr "%localtwo%" (
	cls
	Mode 65,16
	echo.
	echo  --------------------------------------------------------------
	echo                           Update found
	echo  --------------------------------------------------------------
	echo.
	echo                    Your current version: %localtwo%
	echo.
	echo                          New version: %local%
	echo.
	echo.
	echo.
	echo      [Y] Yes, Update
	echo      [N] No
	echo.
	%SystemRoot%\System32\choice.exe /c:YN /n /m "%DEL%                                >:"
	set choice=!errorlevel!
	if !choice! equ 1 (
		curl -L -o %0 "https://github.com/aironasltu/Windows_tweaker/releases/latest/download/Windows_tweaker.Bat" >nul 2>&1
		call %0
		exit /b
	)
	Mode 130,45
)