@ECHO OFF
color 70
cd %~dp0
mode 30,2
echo Applying Theme...


REM saving variables
set "sheets=C:\Program Files\BlueJ\lib\stylesheets"
set program="C:\Program Files\BlueJ\BlueJ.exe"
set "isAdmin=False"

if %1==1 (set "Theme=Default" )
if %1==2 (set "Theme=Dark" )
if %1==3 (set "Theme=Rose" )
if %1==4 (set "Theme=High Contrast" )

call :CheckAdmin
call :CheckPerm

if "%isAdmin%"=="True" (
    call :ReplaceFiles
    start "" %program%
	if "%HasPerm%" == "False" (
	icacls "C:\Program Files\BlueJ\lib\stylesheets" /grant %username%:(OI^)(CI^)F /T
	)
	
) else (
    
	if "%HasPerm%" == "True" (
	call :ReplaceFiles
        start "" %program%
	) else (
	call :RequestAdmin
    )
)
exit /b

:CheckAdmin

REM Check if the script is running with admin privileges
net session >nul 2>&1
if %errorLevel% == 0 set "isAdmin=True"
goto :eof


:ReplaceFiles

xcopy /Q /Y /E /I "%~dp0%Theme% Theme\stylesheets" "%sheets%" > nul 2>&1
taskkill /f /im javaw.exe > nul 2>&1
goto :eof


:CheckPerm

set "HasPerm=False"
icacls "C:\Program Files\BlueJ\lib\stylesheets" | findstr "%username%:(OI)(CI)(F)" > nul 2>&1
if %errorlevel% == 0 set "HasPerm=True"
goto :eof

:RequestAdmin
powershell -Command "Start-Process '%~f0' -ArgumentList '1' -Verb RunAs" & exit
goto :eof

exit /b