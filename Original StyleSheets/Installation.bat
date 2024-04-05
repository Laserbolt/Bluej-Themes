@echo off

REM Define the source folder.
set "sourcePath=%~dp0\stylesheets"

REM Define the destination folder.
set "destinationPath=C:\Program Files\BlueJ\lib\stylesheets"

REM Use xcopy to copy the folder.
xcopy /Y /E /I "%sourcePath%" "%destinationPath%"

REM kill bluej
taskkill /f /im javaw.exe

REM exit the batch file.
exit
