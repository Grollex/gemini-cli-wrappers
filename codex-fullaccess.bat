@echo off
setlocal EnableExtensions

title Codex CLI - Full Access

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

echo [WARNING] Starting Codex CLI with approvals and sandbox bypassed.
echo [WARNING] Codex can edit files and run commands without asking each time.
echo [INFO] Project:
echo %WORK_DIR%
echo.

call codex.cmd --cd "%WORK_DIR%" --dangerously-bypass-approvals-and-sandbox %*

exit /b %ERRORLEVEL%
