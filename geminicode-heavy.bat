@echo off
setlocal EnableExtensions

title Antigravity CLI - Heavy Model

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

echo [WARNING] HEAVY MODEL: use only for difficult tasks.
echo [WARNING] This model consumes the weekly quota much faster.
echo [INFO] Model: %AGY_MODEL%
echo [INFO] Project: %CD%
echo.

"%AGY_EXE%" --model "%AGY_MODEL%" %*
exit /b %ERRORLEVEL%
