@echo off
setlocal EnableExtensions

title Antigravity CLI - Full Access

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

echo [WARNING] Starting Antigravity CLI with automatic tool approval.
echo [WARNING] It can edit files and run commands without asking each time.
echo [INFO] Project: %CD%
echo [INFO] Balanced model: %AGY_MODEL%
echo.

"%AGY_EXE%" --model "%AGY_MODEL%" --dangerously-skip-permissions %*
exit /b %ERRORLEVEL%
