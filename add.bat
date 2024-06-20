@echo off

REM Check if file argument is provided
if "%~1"=="" (
    echo Usage: %~nx0 ^<file1^> ^<file2^> ...
    exit /b 1
)

REM Create .vcs\index directory if it doesn't exist
if not exist ".vcs\index" mkdir ".vcs\index"

REM Loop through provided files
:loop
if "%~1"=="" goto :eof
REM Copy the file to the index directory
copy "%~1" ".vcs\index\"
echo Added "%~1" to staging area
shift
goto loop
