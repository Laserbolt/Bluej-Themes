@ECHO OFF
@Title Theme Menu
color 0F
cd %~dp0

REM saving variables
set sheets="%ProgramFiles%\BlueJ\lib\stylesheets"
set program="%ProgramFiles%\BlueJ\BlueJ.exe"
set "isAdmin=false"

REM create single backspace character for input prompt
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A

:MENU
CLS
@Mode 110,43

chcp 65001 >NUL
ECHO(
ECHO(
ECHO(
ECHO        ██████╗ ██╗     ██╗   ██╗███████╗     ██╗  ████████╗██╗  ██╗███████╗███╗   ███╗███████╗███████╗
ECHO        ██╔══██╗██║     ██║   ██║██╔════╝     ██║  ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝██╔════╝
ECHO        ██████╔╝██║     ██║   ██║█████╗       ██║     ██║   ███████║█████╗  ██╔████╔██║█████╗  ███████╗
ECHO        ██╔══██╗██║     ██║   ██║██╔══╝  ██   ██║     ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  ╚════██║
ECHO        ██████╔╝███████╗╚██████╔╝███████╗╚█████╔╝     ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗███████║
ECHO        ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝ ╚════╝      ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝
ECHO(
ECHO(
ECHO                       ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO                       ┃                                                               ┃
ECHO                       ┃  This is the menu for selecting various Bluej Themes. Either  ┃
ECHO                       ┃     select a theme to install or one the separate options     ┃
ECHO                       ┃                                                               ┃
ECHO                       ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO(
ECHO(
ECHO                    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓           ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO                    ┃                              ┃           ┃                            ┃
ECHO                    ┃  THEMES:                     ┃           ┃  OPTIONS:                  ┃
ECHO                    ┃                              ┃           ┃                            ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━━━┓        ┃           ┃   ┏━━━━━━━━━━━━━┓          ┃
ECHO                    ┃   ┃ 1-Default Theme ┃        ┃           ┃   ┃ 5-Exit Menu ┃          ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━━━━┛        ┃           ┃   ┗━━━━━━━━━━━━━┛          ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━┓           ┃           ┃   ┏━━━━━━━━━━━━━━━┓        ┃
ECHO                    ┃   ┃ 2-Dark Theme ┃           ┃           ┃   ┃ 6-Access Data ┃        ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━┛           ┃           ┃   ┗━━━━━━━━━━━━━━━┛        ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━┓           ┃           ┃   ┏━━━━━━━━━━━━━━┓         ┃
ECHO                    ┃   ┃ 3-Rose Theme ┃           ┃           ┃   ┃ 7-Open Bluej ┃         ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━┛           ┃           ┃   ┗━━━━━━━━━━━━━━┛         ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━━━━━━━━━┓  ┃           ┃   ┏━━━━━━━━━━━━━┓          ┃
ECHO                    ┃   ┃ 4-High Contrast Theme ┃  ┃           ┃   ┃ 8-Open Repo ┃          ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━━━━━━━━━━┛  ┃           ┃   ┗━━━━━━━━━━━━━┛          ┃
ECHO                    ┃                              ┃           ┃                            ┃
ECHO                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛           ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO(
ECHO(
SET /P choice=%BS%                           Type the number next to your choice and press enter: 
chcp 437 >NUL

if %choice%==1 (call :copystyle "Default" )
if %choice%==2 (call :copystyle "Dark" )
if %choice%==3 (call :copystyle "Rose" )
if %choice%==4 (call :copystyle "High Contrast" )
if %choice%==5 (exit /b)
if %choice%==6 (start "" %sheets%)
if %choice%==7 (start "" %program%)
if %choice%==8 (start "" https://github.com/Laserbolt/Bluej-Themes)
GOTO MENU

:copystyle
set "Theme=%~1"
call :CheckAdmin
call :CheckPerm

if "%isAdmin%"=="True" (
    
    call :ReplaceFiles
	if "%HasPerm%" == "False" (
    icacls "C:\Program Files\BlueJ\lib\stylesheets" /grant:r *S-1-1-0:(F^)
	)
	goto :complete
	
) else (
    
	if "%HasPerm%" == "True" (
	call :ReplaceFiles
	goto :complete
	) else (
	call :RequestAdmin
    )
)


:CheckAdmin

REM Check if the script is running with admin privileges
net session >nul 2>&1
if %errorLevel% == 0 set "isAdmin=True"
goto :eof


:ReplaceFiles

xcopy /Q /Y /E /I "%~dp0\%Theme% Theme\stylesheets" %sheets% > nul 2>&1
taskkill /f /im javaw.exe > nul 2>&1
goto :eof


:CheckPerm

set "HasPerm=False"
icacls "C:\Program Files\Bluej\lib\stylesheets" | findstr /i "Everyone:(F)" >nul
if %errorlevel% == 0 set "HasPerm=True"
goto :eof


:RequestAdmin

CLS
echo   This user does not have write permission to : %sheets%
echo   In order to procede please choose one of the options
echo.
echo   1. Run as Administrator (Once)
echo   2. Replace files manually
set /p choice=Choose an option (1 or 2): 

if "%choice%"=="1" (
    REM Request admin rights and run the script again
    powershell -Command "Start-Process '%~f0' -ArgumentList '1' -Verb RunAs" & exit
	pause

) else if "%choice%"=="2" (
    echo Please replace the CSS files manually in "%sheets%".
    pause
	goto :MENU
) else (
    echo Invalid choice.
    pause
	goto :MENU
)

:complete
@Mode 96,16
CLS

chcp 65001 >NUL
ECHO(
ECHO      ________  __________  _________   _____   ________________    __    __    __________
ECHO     /_  __/ / / / ____/  ┃/  / ____/  /  _/ ┃ / / ___/_  __/   ┃  / /   / /   / ____/ __ \
ECHO      / / / /_/ / __/ / /┃_/ / __/     / //  ┃/ /\__ \ / / / /┃ ┃ / /   / /   / __/ / / / /
ECHO     / / / __  / /___/ /  / / /___   _/ // /┃  /___/ // / / ___ ┃/ /___/ /___/ /___/ /_/ /
ECHO    /_/ /_/ /_/_____/_/  /_/_____/  /___/_/ ┃_//____//_/ /_/  ┃_/_____/_____/_____/_____/
ECHO(
ECHO(
ECHO          ┏━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━┓
ECHO          ┃ 1-Exit Menu ┃   ┃ 2-Return to Menu ┃   ┃ 3-Open Bluej ┃
ECHO          ┗━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━━━┛
ECHO(
ECHO(
SET /P choice=%BS%           Type the number next to the text and press enter: 
chcp 437 >NUL

if %choice%==1 (exit)
if %choice%==2 (GOTO MENU)
if %choice%==3 (start "" %program%)
GOTO complete

exit /b