@ECHO OFF
@Title %~n0
cd "%~dp0\Menu code"
color 0F

:MENU
CLS
@Mode 110,43
chcp 65001 >NUL

ECHO.
ECHO.
ECHO.
ECHO        ██████╗ ██╗     ██╗   ██╗███████╗     ██╗  ████████╗██╗  ██╗███████╗███╗   ███╗███████╗███████╗
ECHO        ██╔══██╗██║     ██║   ██║██╔════╝     ██║  ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝██╔════╝
ECHO        ██████╔╝██║     ██║   ██║█████╗       ██║     ██║   ███████║█████╗  ██╔████╔██║█████╗  ███████╗
ECHO        ██╔══██╗██║     ██║   ██║██╔══╝  ██   ██║     ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  ╚════██║
ECHO        ██████╔╝███████╗╚██████╔╝███████╗╚█████╔╝     ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗███████║
ECHO        ╚═════╝ ╚══════╝ ╚═════╝ ╚══════╝ ╚════╝      ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝╚══════╝
ECHO.
ECHO.
ECHO                       ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO                       ┃                                                              ┃
ECHO                       ┃ This is the menu for selecting various Bluej Themes. Either  ┃
ECHO                       ┃ select a theme to install or one the separate options        ┃
ECHO                       ┃                                                              ┃
ECHO                       ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO.
ECHO.
ECHO                    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓           
ECHO                    ┃                              ┃           ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO                    ┃  THEMES:                     ┃           ┃                            ┃
ECHO                    ┃                              ┃           ┃  OPTIONS:                  ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━━━┓        ┃           ┃                            ┃
ECHO                    ┃   ┃ 1-Default Theme ┃        ┃           ┃   ┏━━━━━━━━━━━━━┓          ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━━━━┛        ┃           ┃   ┃ 5-Exit Menu ┃          ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━┓           ┃           ┃   ┗━━━━━━━━━━━━━┛          ┃
ECHO                    ┃   ┃ 2-Dark Theme ┃           ┃           ┃   ┏━━━━━━━━━━━━━━━┓        ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━┛           ┃           ┃   ┃ 6-Access Data ┃        ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━┓           ┃           ┃   ┗━━━━━━━━━━━━━━━┛        ┃
ECHO                    ┃   ┃ 3-Rose Theme ┃           ┃           ┃   ┏━━━━━━━━━━━━━━┓         ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━┛           ┃           ┃   ┃ 7-Open Bluej ┃         ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━━━━━━━━━┓  ┃           ┃   ┗━━━━━━━━━━━━━━┛         ┃
ECHO                    ┃   ┃ 4-High Contrast Theme ┃  ┃           ┃                            ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━━━━━━━━━━┛  ┃           ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO                    ┃                              ┃           
ECHO                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛           
ECHO.
ECHO.
SET /P errorlevel=.                         Type the number next to the option and press enter:
chcp 437 >NUL

CLS
if %errorlevel%==1 (GOTO Selection1)
if %errorlevel%==2 (GOTO Selection2)
if %errorlevel%==3 (GOTO Selection3)
if %errorlevel%==4 (GOTO Selection4)
if %errorlevel%==5 (exit /b)
if %errorlevel%==6 (start "" "C:\Program Files\BlueJ\lib\stylesheets")
if %errorlevel%==7 (start "" "C:\Program Files\BlueJ\BlueJ.exe")
GOTO MENU

:Selection1
xcopy /Q /Y /E /I "%~dp0\Default Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection2
xcopy /Q /Y /E /I "%~dp0\Dark Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection3
xcopy /Q /Y /E /I "%~dp0\Rose Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection4
xcopy /Q /Y /E /I "%~dp0\High Contrast Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:complete
@Mode 96,16
CLS

chcp 65001 >NUL
ECHO.
ECHO      ________  __________  _________   _____   ________________    __    __    __________
ECHO     /_  __/ / / / ____/  ┃/  / ____/  /  _/ ┃ / / ___/_  __/   ┃  / /   / /   / ____/ __ \
ECHO      / / / /_/ / __/ / /┃_/ / __/     / //  ┃/ /\__ \ / / / /┃ ┃ / /   / /   / __/ / / / /
ECHO     / / / __  / /___/ /  / / /___   _/ // /┃  /___/ // / / ___ ┃/ /___/ /___/ /___/ /_/ /
ECHO    /_/ /_/ /_/_____/_/  /_/_____/  /___/_/ ┃_//____//_/ /_/  ┃_/_____/_____/_____/_____/
ECHO.         
ECHO.
ECHO          ┏━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━┓
ECHO          ┃ 1-Exit Menu ┃   ┃ 2-Return to Menu ┃   ┃ 3-Open Bluej ┃
ECHO          ┗━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━━━┛
ECHO.
ECHO.
SET /P errorlevel=.        Type the number next to the option and press enter:
chcp 437 >NUL

if %errorlevel%==1 (exit /b)
if %errorlevel%==2 (GOTO MENU)
if %errorlevel%==3 (start "" "C:\Program Files\BlueJ\BlueJ.exe")
GOTO complete