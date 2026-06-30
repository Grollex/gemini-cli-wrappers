@echo off
setlocal EnableExtensions

title Gemini CLI - Check Primary Profile

where gemini >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Gemini CLI is not installed or not found in PATH.
    pause
    exit /b 1
)

set "GEMINI_CLI_HOME=%~dp0gemini-profiles\primary"
set "GEMINI_DEFAULT_AUTH_TYPE=oauth-personal"
set "GEMINI_API_KEY="
set "GOOGLE_API_KEY="
set "GOOGLE_APPLICATION_CREDENTIALS="
set "GOOGLE_GENAI_USE_VERTEXAI="
set "GOOGLE_GENAI_USE_GCA="
cd /d "%~dp0"

echo [INFO] Checking primary profile:
echo %GEMINI_CLI_HOME%
echo.

gemini --skip-trust --approval-mode yolo --output-format text --prompt "Reply with exactly: PRIMARY_PROFILE_OK"

echo.
pause
