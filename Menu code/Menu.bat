@ECHO OFF
@Title %~n0

cd %~dp0 &:: Added line for program to work when run as admin
Batbox /h 0

:MENU
@Mode 85,37

CLS

ECHO.
ECHO.
ECHO            ____  __    __  ________    __   ________  __________  ______________
ECHO           / __ )/ /   / / / / ____/   / /  /_  __/ / / / ____/  ^|/  / ____/ ___/
ECHO          / __  / /   / / / / __/ __  / /    / / / /_/ / __/ / /^|_/ / __/  \__ \ 
ECHO         / /_/ / /___/ /_/ / /___/ /_/ /    / / / __  / /___/ /  / / /___ ___/ / 
ECHO        /_____/_____/\____/_____/\____/    /_/ /_/ /_/_____/_/  /_/_____//____/                                                                        
ECHO.
ECHO          _______________________________________________________________
ECHO          ^|                                                              ^|
ECHO          ^| This is the menu for selecting various Bluej Themes. Either  ^| 
ECHO          ^| select a theme to install or one the separate options        ^|   
ECHO          ^|______________________________________________________________^|
ECHO.
ECHO.
ECHO       _____________________________                  ________________________
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^| THEMES:                    ^|                 ^| OPTIONS:              ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|                       ^|
ECHO       ^|                            ^|                 ^|_______________________^|
ECHO       ^|                            ^|                 
ECHO       ^|                            ^|                 
ECHO       ^|____________________________^|                 

:Loop
Call Button  9 20 "Default Theme" 9 23 "Dark Theme" 9 26 "Rose Theme" 9 29 "High Contrast Theme" 56 20 "Exit Menu" 56 23 "Accesss Data" 56 26 "Open Bluej" # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (GOTO Selection1)
if %errorlevel%==2 (GOTO Selection2)
if %errorlevel%==3 (GOTO Selection3)
if %errorlevel%==4 (GOTO Selection4)
if %errorlevel%==5 (exit)
if %errorlevel%==6 (GOTO Stylesheets)
if %errorlevel%==7 (start "" "C:\Program Files\BlueJ\BlueJ.exe")

GOTO MENU

:Selection1
cls
xcopy /Y /E /I "%~dp0..\Default Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection2
cls
xcopy /Y /E /I "%~dp0..\Dark Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection3
cls
xcopy /Y /E /I "%~dp0..\Rose Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection4
cls
xcopy /Y /E /I "%~dp0..\High Contrast Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Stylesheets
start "" "C:\Program Files\BlueJ\lib\stylesheets"
GOTO MENU

:complete
@Mode 96,14

CLS

ECHO.
ECHO      ________  __________  _________   _____   ________________    __    __    __________ 
ECHO     /_  __/ / / / ____/  ^|/  / ____/  /  _/ ^| / / ___/_  __/   ^|  / /   / /   / ____/ __ \
ECHO      / / / /_/ / __/ / /^|_/ / __/     / //  ^|/ /\__ \ / / / /^| ^| / /   / /   / __/ / / / /
ECHO     / / / __  / /___/ /  / / /___   _/ // /^|  /___/ // / / ___ ^|/ /___/ /___/ /___/ /_/ / 
ECHO    /_/ /_/ /_/_____/_/  /_/_____/  /___/_/ ^|_//____//_/ /_/  ^|_/_____/_____/_____/_____/  
ECHO.


:Loop
Call Button  9 9 "Exit menu"  25 9 "Return to menu" 46 9 "Open Bluej" # Press
Getinput /m %Press% /h 70

if %errorlevel%==1 (exit)
if %errorlevel%==2 (GOTO MENU)
if %errorlevel%==3 (start "" "C:\Program Files\BlueJ\BlueJ.exe")

GOTO complete