@ECHO OFF
color 70
cd %~dp0
mode 30,2

call :CheckAdmin
call :CheckPerm
call :checkUpdate
call :updateClean

REM saving variables
set "sheets=C:\Program Files\BlueJ\lib\stylesheets"
set program="C:\Program Files\BlueJ\BlueJ.exe"
set "isAdmin=False"
set latest="false"
set allowupdate=N
set currentFolder=%~dp0
set zipFolder=%currentFolder%\zip
set zipFile=Bluej-Hub.zip
set newHTA=Menu.hta
set downloadUrl=https://github.com/Laserbolt/Bluej-Themes/archive/refs/tags/%latestVersion%.zip

if %1==1 (set "Theme=Default" )
if %1==2 (set "Theme=Dark" )
if %1==3 (set "Theme=Rose" )
if %1==4 (set "Theme=High Contrast" )

if /i %latest%=="false" (
    set /p allowupdate=Do you want to update, enter y or n 
    cls
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

REM Check if the script is running with admin privileges
net session >nul 2>&1
if %errorLevel% == 0 set "isAdmin=True"
goto :eof


:updateClean

REM Get the name of the current directory
for %%d in ("%cd%") do set CURRENT_DIR=%%~nxd

REM Go one directory up
cd ..

REM Loop through all folders starting with "Bluej-"
for /d %%f in (Bluej-*) do (
    :: Check if the folder name is not the current directory
    if not "%%~nxf"=="%CURRENT_DIR%" (
        echo Deleting folder %%f
        rmdir /s /q "%%f"
    )
)

REM Return to the original directory
cd "%CURRENT_DIR%"
pause
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

:checkUpdate

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

REM Read the config.ini file and extract the version
for /f "tokens=2 delims==" %%i in ('findstr /r "^version =" res\config.ini') do (
    set currentVersion=%%i
)

REM Remove leading spaces from the version string
set currentVersion=%currentVersion: =%

REM set latest variable
if %latestVersion%==%currentVersion% ( 
    set latest="true"
)

goto :eof

:update
echo on

REM Download the latest ZIP file
curl -L -s -o "..\%zipFile%" "%downloadUrl%"

REM Unzip the file
powershell -command "Expand-Archive -Path '..\%zipFile%' -DestinationPath '..\Bluej-Hub'"

REM Delete the ZIP file
cd ..
del "%zipFile%"

REM Close the current HTA
taskkill /IM mshta.exe /F > nul 2>&1

REM Open the new HTA
set tempver=%latestVersion:~1%
set baseDir=%~dp0..\
set htaPath=%baseDir%Bluej-Hub\Bluej-Themes-%tempver%\Menu.hta
start "" "%htaPath%"

pause
REM delete current version
cd %~dp0..\..
rd /s /q "Bluej-Hub"

exit /b