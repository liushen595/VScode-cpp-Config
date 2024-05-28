@echo off
setlocal enabledelayedexpansion

rem Get the current workspace folder
set filedir=%~dp0
cd /d %filedir%

rem Loop through each project folder
if exist "%filedir%src" (
    rem Create the bin directory if it doesn't exist
    if not exist "%filedir%bin" mkdir "%filedir%\bin"
)

if exist "%filedir%src" (
    rem Compile each .cpp file in the src directory into a .dll with debug information and include directory
    
    for %%f in (%filedir%src\*.cpp) do (
        set filename=%%~nf
        g++ -shared -g -I "%filedir%lib" -o "%filedir%bin\!filename!.dll" "%%f"
        if errorlevel 1 exit /b %errorlevel%
        )
    )

if exist "%filedir%src" (
    rem Find the main cpp file (user needs to provide this name as an argument)
    if "%1"=="" (
        echo Error: No main cpp file specified.
        exit /b 1
    )

    set maincpp=%1
    set main=%2

    rem Check if the specified main file exists
    if not exist "!maincpp!.cpp" (
        echo Error: Specified main cpp file "!maincpp!" does not exist.
        exit /b 1
    )

    set dlls=
    set libs=
    for %%f in (%filedir%bin\*.dll) do (
        set dllname=%%~nf
        set dlls=!dlls! "%%f"
        set libs=!libs! -l!dllname!
    )

    g++ "!maincpp!.cpp" -g -I "%filedir%lib" -L "%filedir%bin" !libs! -o "%filedir%bin\!main!.exe"
    if errorlevel 1 exit /b %errorlevel%
)
endlocal
