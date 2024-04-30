@ECHO OFF
@Title %~n0
cd "%~dp0\Menu code"
color 0F

:MENU
CLS
@Mode 110,40
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
ECHO                    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓           ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃  THEMES:                   ┃           ┃  OPTIONS:                  ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━┓        ┃           ┃   ┏━━━━━━━━━━━┓            ┃
ECHO                    ┃   ┃ Default Theme ┃        ┃           ┃   ┃ Exit Menu ┃            ┃
ECHO                    ┃   ┗━━━━━━━━━━━━━━━┛        ┃           ┃   ┗━━━━━━━━━━━┛            ┃
ECHO                    ┃   ┏━━━━━━━━━━━━┓           ┃           ┃   ┏━━━━━━━━━━━━━┓          ┃
ECHO                    ┃   ┃ Dark Theme ┃           ┃           ┃   ┃ Access Data ┃          ┃
ECHO                    ┃   ┗━━━━━━━━━━━━┛           ┃           ┃   ┗━━━━━━━━━━━━━┛          ┃
ECHO                    ┃   ┏━━━━━━━━━━━━┓           ┃           ┃   ┏━━━━━━━━━━━━┓           ┃
ECHO                    ┃   ┃ Rose Theme ┃           ┃           ┃   ┃ Open Bluej ┃           ┃
ECHO                    ┃   ┗━━━━━━━━━━━━┛           ┃           ┃   ┗━━━━━━━━━━━━┛           ┃
ECHO                    ┃   ┏━━━━━━━━━━━━━━━━━━━━━┓  ┃           ┃                            ┃
ECHO                    ┃   ┃ High Contrast Theme ┃  ┃           ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO                    ┃   ┗━━━━━━━━━━━━━━━━━━━━━┛  ┃
ECHO                    ┃                            ┃
ECHO                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO.
ECHO.

chcp 437 >NUL
GetInput /M 24 24 38 24 24 27 35 27 24 30 35 30 24 33 44 33 65 24 75 24 65 27 77 27 65 30 76 30 /H 70
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
@Mode 96,14
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
ECHO          ┏━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━┓
ECHO          ┃ Exit Menu ┃   ┃ Return to Menu ┃   ┃ Open Bluej ┃
ECHO          ┗━━━━━━━━━━━┛   ┗━━━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━┛
ECHO.
ECHO.

chcp 437 >NUL
Getinput /M 10 9 20 9 26 9 41 9 47 9 58 9 /H 70

if %errorlevel%==1 (exit /b)
if %errorlevel%==2 (GOTO MENU)
if %errorlevel%==3 (start "" "C:\Program Files\BlueJ\BlueJ.exe")
GOTO complete