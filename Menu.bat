@ECHO OFF

C:
CD\
CLS

:MENU
CLS

ECHO.
ECHO ============= BLUEJ THEME MENU =============
ECHO.
ECHO -----------------------------------------
ECHO  Please type the appropriate number next
ECHO  to each option given below. For example
ECHO  type 1 for the default theme.
ECHO -----------------------------------------
ECHO.
ECHO    1.  Default Theme
ECHO    2.  Dark Theme
ECHO    3.  Rose Theme
ECHO    4.  High Contrast Theme
ECHO.
ECHO.
ECHO ============================================
ECHO.
ECHO.

SET INPUT=
SET /P INPUT=Please type a number:

IF /I '%INPUT%'=='1' GOTO Selection1
IF /I '%INPUT%'=='2' GOTO Selection2
IF /I '%INPUT%'=='3' GOTO Selection3
IF /I '%INPUT%'=='4' GOTO Selection4

CLS

ECHO ============ INVALID INPUT ============
ECHO.
ECHO -------------------------------------
ECHO Please select a number from the Main
echo Menu [1-9].
ECHO -------------------------------------
ECHO.
ECHO ====== PRESS ANY KEY TO CONTINUE ======

PAUSE > NUL
GOTO MENU

:Selection1
xcopy /Y /E /I "%~dp0\Default Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection2
xcopy /Y /E /I "%~dp0\Dark Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection3
xcopy /Y /E /I "%~dp0\Rose Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection4
xcopy /Y /E /I "%~dp0\High Contrast Theme\stylesheets" "C:\Program Files\BlueJ\lib\stylesheets"
taskkill /f /im javaw.exe
GOTO complete

:Selection5
and so on

:complete

CLS

ECHO.
ECHO ============== THEME INSTALLED SUCCESSFULLY ===============
ECHO.
ECHO -----------------------------------------------------------
ECHO.
ECHO ================== PRESS ANY KEY TO EXIT ==================

PAUSE>NUL
EXIT