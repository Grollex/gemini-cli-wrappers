@echo off
setlocal EnableExtensions

title Antigravity CLI - Heavy Model - Full Access

set "AGY_EXE=%LOCALAPPDATA%\agy\bin\agy.exe"
set "AGY_MODEL=gemini-3.1-pro"
if not exist "%AGY_EXE%" (
    echo [ERROR] Antigravity CLI is not installed.
    echo Install it with:
    echo powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://antigravity.google/cli/install.ps1 ^| iex"
    echo.
    pause
    exit /b 1
)

echo [WARNING] HEAVY MODEL WITH AUTOMATIC TOOL APPROVAL.
echo [WARNING] This is the highest-consumption launcher.
echo [INFO] Model: %AGY_MODEL%
echo [INFO] Project: %CD%
echo.

"%AGY_EXE%" --model "%AGY_MODEL%" --dangerously-skip-permissions %*
exit /b %ERRORLEVEL%
