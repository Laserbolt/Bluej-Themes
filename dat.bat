@ECHO OFF
cd %~dp0

call :CheckAdmin
call :CheckPerm
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

call :checkUpdate

set downloadUrl=https://github.com/Laserbolt/Bluej-Themes/archive/refs/tags/%latestVersion%.zip

if %1==1 (set "Theme=Default" )
if %1==2 (set "Theme=Dark" )
if %1==3 (set "Theme=Rose" )
if %1==4 (set "Theme=High Contrast" )

if /i %latest%=="false" (
    set /p allowupdate=Do you want to update, enter y or n : 
    cls
)
if /i %allowupdate%==y (
    call :update  
)

if "%isAdmin%"=="True" (
    call :ReplaceFiles
    start "" %program%
	if "%HasPerm%" == "False" (
	icacls "%~dp0..\.." /grant %username%:(OI^)(CI^)F /T
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

REM store actual path not folder
set "CURRENT_DIR=%cd%"

REM Store the full path of the current directory
cd ..
set "CURRENT_TOP_DIR=%cd%"

REM Move two directories up
cd ..
set PARENT_DIR=%cd:\=%
 
REM Loop through all folders in the current (two-levels-up) directory starting with "Bluej-"
for /d %%f in ("%PARENT_DIR%\Bluej-*") do (
    REM Check if the folder path matches the current directory's full path
    if /i not "%%~f"=="%CURRENT_TOP_DIR%" (
        echo Deleting folder %%f
        echo rmdir /s /q "%%~f"
    )
)

REM Return to the original directory
cd "%CURRENT_DIR%"
goto :eof

:ReplaceFiles

echo Applying Theme...
xcopy /Q /Y /E /I "%~dp0%Theme% Theme\stylesheets" "%sheets%" > nul 2>&1
taskkill /f /im javaw.exe > nul 2>&1
goto :eof


:CheckPerm

set "HasPerm=False"
icacls "%~dp0..\.." | findstr "%username%:(OI)(CI)(F)" > nul 2>&1
icacls "C:\Program Files\BlueJ\lib\stylesheets" | findstr "%username%:(OI)(CI)(F)" > nul 2>&1
if %errorlevel% == 0 set "HasPerm=True"
goto :eof

:RequestAdmin

powershell -Command "Start-Process '%~f0' -ArgumentList '1' -Verb RunAs" & exit
goto :eof

:checkUpdate

cd %~dp0

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

REM Download the latest ZIP file
curl -L -s -o "..\..\%zipFile%" "%downloadUrl%"

REM Unzip the file
powershell -NoProfile -NonInteractive -command "Expand-Archive -Path '..\..\%zipFile%' -DestinationPath '..\..\Bluej-Hub-%latestVersion%'"

REM Delete the ZIP file
del "..\..\%zipFile%"

REM Close the current HTA
taskkill /IM mshta.exe /F > nul 2>&1

REM Open the new HTA
set tempver=%latestVersion:~1%
cd ..\..\Bluej-Hub-%latestVersion%\Bluej-Themes-%tempver%
start "" "Menu.hta"

exit /b