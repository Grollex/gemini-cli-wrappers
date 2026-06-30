@echo off
setlocal EnableExtensions

title Antigravity CLI

set "AGY_EXE=%LOCALAPPDATA%\agy\bin\agy.exe"
set "AGY_MODEL=gemini-3.5-flash-low"
if not exist "%AGY_EXE%" (
    echo [ERROR] Antigravity CLI is not installed.
    echo Install it with:
    echo powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://antigravity.google/cli/install.ps1 ^| iex"
    echo.
    pause
    exit /b 1
)

echo [INFO] Starting Antigravity CLI %CD%
echo [INFO] Balanced model: %AGY_MODEL%
echo.

"%AGY_EXE%" --model "%AGY_MODEL%" %*
exit /b %ERRORLEVEL%
