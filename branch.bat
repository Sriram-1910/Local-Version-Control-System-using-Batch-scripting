@echo off

REM Step 1: Parse Command Arguments
set COMMAND=%1
set BRANCH_NAME=%2
set NEW_BRANCH_NAME=%3

REM Step 2: Define Repository Path
set REPO_PATH=D:\Project\vsc\my_vcs

REM Step 3: Branch Command Logic
if "%COMMAND%" == "create" (
    REM Logic to create a new branch
    if not "%BRANCH_NAME%" == "" (
        echo Creating branch %BRANCH_NAME%...
        mkdir "%REPO_PATH%\%BRANCH_NAME%"
        echo Branch %BRANCH_NAME% created successfully.
    ) else (
        echo Invalid command. Usage: branch create [branch_name]
    )
) else if "%COMMAND%" == "list" (
    REM Logic to list all branches
    for /d %%I in ("%REPO_PATH%\*") do (
        echo %%~nI
    )
) else if "%COMMAND%" == "rename" (
    REM Logic to rename a branch
    if not "%BRANCH_NAME%" == "" if not "%NEW_BRANCH_NAME%" == "" (
        echo Renaming branch %BRANCH_NAME% to %NEW_BRANCH_NAME%...
        ren "%REPO_PATH%\%BRANCH_NAME%" "%NEW_BRANCH_NAME%"
        echo Branch %BRANCH_NAME% renamed to %NEW_BRANCH_NAME% successfully.
    ) else (
        echo Invalid command. Usage: branch rename [old_branch_name] [new_branch_name]
    )
) else if "%COMMAND%" == "delete" (
    REM Logic to delete a branch
    if not "%BRANCH_NAME%" == "" (
        echo Deleting branch %BRANCH_NAME%...
        rd /s /q "%REPO_PATH%\%BRANCH_NAME%"
        echo Branch %BRANCH_NAME% deleted successfully.
    ) else (
        echo Invalid command. Usage: branch delete [branch_name]
    )
) else if "%COMMAND%" == "switch" (
    REM Logic to switch to a branch
    if not "%BRANCH_NAME%" == "" (
        echo Switching to branch %BRANCH_NAME%...
        cd /d "%REPO_PATH%\%BRANCH_NAME%"
        echo Now in branch %BRANCH_NAME%.
    ) else (
        echo Invalid command. Usage: branch switch [branch_name]
    )
) else if "%COMMAND%" == "up" (
    REM Logic to navigate up one directory level
    call ..\up.bat
) else (
    REM Step 5: Handle Invalid Commands
    echo Invalid command. Usage: branch [create|list|rename|delete|switch|up] [branch_name] [new_branch_name]
)

REM Step 6: End of Command
