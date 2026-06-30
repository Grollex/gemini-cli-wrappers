@echo off
setlocal EnableExtensions

title Gemini CLI - Secondary Full Access

where gemini >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Gemini CLI is not installed or not found in PATH.
    echo Install it with:
    echo npm install -g @google/gemini-cli@latest
    echo.
    pause
    exit /b 1
)

set "GEMINI_CLI_HOME=%~dp0gemini-profiles\secondary"
set "GEMINI_DEFAULT_AUTH_TYPE=oauth-personal"
set "GEMINI_API_KEY="
set "GOOGLE_API_KEY="
set "GOOGLE_APPLICATION_CREDENTIALS="
set "GOOGLE_GENAI_USE_VERTEXAI="
set "GOOGLE_GENAI_USE_GCA="
if not exist "%GEMINI_CLI_HOME%" mkdir "%GEMINI_CLI_HOME%"

cd /d "%~dp0"

echo [WARNING] Starting Gemini CLI SECONDARY profile with full tool approval.
echo [WARNING] Gemini can edit files and run commands without asking each time.
echo [INFO] Profile:
echo %GEMINI_CLI_HOME%
echo.

gemini --skip-trust --approval-mode yolo %*

exit /b %ERRORLEVEL%
