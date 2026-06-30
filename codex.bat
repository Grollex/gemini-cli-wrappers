@echo off
setlocal EnableExtensions

title Codex CLI

where codex.cmd >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Codex CLI is not installed or not found in PATH.
    echo Install it with:
    echo npm install -g @openai/codex@latest
    echo.
    pause
    exit /b 1
)

set "WORK_DIR=%CD%"

echo [INFO] Starting Codex CLI in:
echo %WORK_DIR%
echo.

call codex.cmd --cd "%WORK_DIR%" --sandbox workspace-write --ask-for-approval on-request %*

exit /b %ERRORLEVEL%
