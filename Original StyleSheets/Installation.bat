@echo off

REM Define the source folder.
set "sourcePath=C:\Users\%USERNAME%\Downloads\Bluej-Dark-Theme-main\Original StyleSheets\stylesheets"

REM Define the destination folder.
set "destinationPath=C:\Program Files\BlueJ\lib\stylesheets"

REM Use xcopy to copy the folder.
xcopy /E /I "%sourcePath%" "%destinationPath%"

REM kill bluej
taskkill /f /im javaw.exe

REM exit the batch file.
exit