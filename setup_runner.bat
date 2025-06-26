@echo off
setlocal enabledelayedexpansion

:: Get the current user's desktop path
for /f "tokens=2,*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop 2^>nul') do (
    set "DESKTOP=%%B"
)

:: Set runner folder path
set "RUNNER_FOLDER=%DESKTOP%\ps1_runner"

:: Create folder if it doesn't exist
if not exist "%RUNNER_FOLDER%" (
    mkdir "%RUNNER_FOLDER%"
    echo [?] Created folder: %RUNNER_FOLDER%
) else (
    echo [i] Folder already exists: %RUNNER_FOLDER%
)

:: Copy run-safe.ps1 from the current directory to the folder
set "SOURCE_FILE=%~dp0run-safe.ps1"
set "DEST_FILE=%RUNNER_FOLDER%\run-safe.ps1"

if exist "!SOURCE_FILE!" (
    copy /Y "!SOURCE_FILE!" "!DEST_FILE!" >nul
    echo [?] Copied run-safe.ps1 to ps1_runner
) else (
    echo [?] ERROR: run-safe.ps1 not found in current directory.
)

echo.
echo --------------------------------------------------
echo ? How to use:
echo 1. Move your .ps1 scripts into the 'ps1_runner' folder on Desktop.
echo 2. Open PowerShell and run:
echo    .\run-safe.ps1 .\your-script.ps1
echo --------------------------------------------------
pause
exit /b
