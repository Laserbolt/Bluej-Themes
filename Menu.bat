@ECHO OFF
@Title %~n0

cd "%~dp0\Menu code" &:: Added line for program to work when run as admin
Batbox /h 0
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
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┃                            ┃
ECHO                    ┃                            ┃           ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO                    ┃                            ┃
ECHO                    ┃                            ┃
ECHO                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
chcp 437 >NUL

:Loop
Call Button  23 23 "Default Theme" 23 26 "Dark Theme" 23 29 "Rose Theme" 23 32 "High Contrast Theme" 64 23 "Exit Menu" 64 26 "Accesss Data" 64 29 "Open Bluej" # Press
Getinput /m %Press% /h 70
CLS

if %errorlevel%==1 (GOTO Selection1 & taskkill /f /im javaw.exe)
if %errorlevel%==2 (GOTO Selection2)
if %errorlevel%==3 (GOTO Selection3)
if %errorlevel%==4 (GOTO Selection4)
if %errorlevel%==5 (exit)
if %errorlevel%==6 (start "" "C:\Program Files\BlueJ\lib\stylesheets")
if %errorlevel%==7 (start "" "C:\Program Files\BlueJ\BlueJ.exe")

GOTO MENU

:Selection1
xcopy /Q /Y /E /I "%~dp0\Default Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
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
ECHO    /_/ /_/ /_/_____/_/  /_/_____/  /___/_/ ┃_//____//_/ /_/  ┃_/_____/_____/_____/____━/  
ECHO.
chcp 437 >NUL

:Loop
Call Button  9 9 "Exit menu"  25 9 "Return to menu" 46 9 "Open Bluej" # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (exit)
if %errorlevel%==2 (GOTO MENU)
if %errorlevel%==3 (start "" "C:\Program Files\BlueJ\BlueJ.exe")

GOTO complete
