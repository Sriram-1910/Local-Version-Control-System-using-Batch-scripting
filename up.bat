@echo off

REM Get the current directory path
set "CURRENT_DIR=%~dp0"

REM Extract the parent directory path
for %%I in ("%CURRENT_DIR%..") do set "PARENT_DIR=%%~fI"

REM Change the current directory to the parent directory
cd /d "%PARENT_DIR%"
