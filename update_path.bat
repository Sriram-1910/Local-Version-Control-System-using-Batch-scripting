@echo off
setlocal

REM Specify the path to your custom commands folder
set CUSTOM_COMMANDS_PATH=D:\Project\vsc\my_vcs\hidden_folder

REM Add the custom commands folder to the system PATH
set "PATH=%CUSTOM_COMMANDS_PATH%;%PATH%"

REM Update the system PATH environment variable
setx PATH "%PATH%" /m

echo Custom commands folder added to system PATH successfully.

endlocal
