@ECHO OFF
cd %~dp0

REM saving variables
set "sheets=C:\Program Files\BlueJ\lib\stylesheets"
set program="C:\Program Files\BlueJ\BlueJ.exe"
set "isAdmin=False"
set latest="false"
set allowupdate=N

if %1==1 (set "Theme=Default" )
if %1==2 (set "Theme=Dark" )
if %1==3 (set "Theme=Rose" )
if %1==4 (set "Theme=High Contrast" )

call :CheckAdmin
call :CheckPerm
call :CheckUpdate

if /i %latest%=="false" (
    if %isAdmin%==False (
	    set /p allowupdate=Do you want to update, type y or n and press enter : 
	) else (
	    call :update
	)
    
)
if /i %allowupdate%==y (
    call :update  
)

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

net session >nul 2>&1
if %errorLevel% == 0 set "isAdmin=True"
goto :eof

:ReplaceFiles

echo Applying Theme...
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

:CheckUpdate

REM Fetch and clean the latest release version tag from GitHub API
for /f "tokens=*" %%i in ('curl -s https://api.github.com/repos/Laserbolt/Bluej-Themes/releases/latest ^| findstr /r /c:"\"tag_name\":"') do (
    set latestVersion=%%i
    goto :doneapi
)

:doneapi

REM Remove the "tag_name": part, quotes, and any trailing commas
set latestVersion=%latestVersion:*"tag_name": =%
set latestVersion=%latestVersion:"=%
set latestVersion=%latestVersion:,=%

REM Read the config.ini file and extract the current version
for /f "tokens=2 delims==" %%i in ('findstr /r "^version =" res\config.ini') do (
    set currentVersion=%%i
)

REM Remove leading spaces from the current version string
set currentVersion=%currentVersion: =%

REM set if latest
if %latestVersion%==%currentVersion% ( 
    set latest="true"
)

goto :eof

:update

if "%isAdmin%" == "False" ( call :RequestAdmin )

set downloadUrl=https://github.com/Laserbolt/Bluej-Themes/archive/refs/tags/%latestVersion%.zip

REM Download the latest ZIP file
curl -L -s -o "..\..\Bluej-Hub.zip" "%downloadUrl%"

REM Unzip the file
powershell -NoProfile -NonInteractive -command "Expand-Archive -Path '..\..\Bluej-Hub.zip' -DestinationPath '..\..\Bluej-Themes-Hub'"

REM Delete the ZIP file
del "..\..\Bluej-Hub.zip"

REM Close the current HTA
taskkill /IM mshta.exe /F > nul 2>&1

REM Open the new HTA
set tempver=%latestVersion:~1%
cd ..\Bluej-Themes-%tempver%
start "" "Menu.hta"

REM Delete current version
cd %~dp0..
start /b "" cmd /c rd /s /q "%~dp0" 

exit /b