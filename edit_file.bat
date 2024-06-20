@echo off

REM Check if file argument is provided
if "%~1"=="" (
    echo Usage: %~nx0 ^<file^>
    exit /b 1
)

REM Open the specified file for editing in Notepad
notepad %~1
