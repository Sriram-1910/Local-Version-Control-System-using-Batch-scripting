@echo off

REM Define path to repository
set REPO_PATH=D:\Project\vsc\my_vcs

REM Parse command arguments
set BRANCH_NAME=%1

REM Checkout command logic
if not "%BRANCH_NAME%" == "" (
    echo Switching to branch %BRANCH_NAME%...
    REM Add code to switch to the specified branch
    cd /d "%REPO_PATH%\%BRANCH_NAME%"
    echo Now in branch %BRANCH_NAME%.
) else (
    echo Invalid command. Usage: checkout [branch_name]
)
