@echo off

REM Define the source folder.
set "sourcePath=C:\Users\%USERNAME%\Downloads\Bluej-Dark-Theme-main\BlueJ Dark Theme\stylesheets"

REM Define the destination folder.
set "destinationPath=C:\Program Files\BlueJ\lib\stylesheets"

REM Use xcopy to copy the folder.
xcopy /E /I "%sourcePath%" "%destinationPath%"

REM exit the batch file.
exit