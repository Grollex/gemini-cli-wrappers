@echo off
setlocal EnableExtensions

title Gemini CLI - Login Primary Account

where gemini >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Gemini CLI is not installed or not found in PATH.
    echo Install it with:
    echo npm install -g @google/gemini-cli@latest
    echo.
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
if not exist "%GEMINI_CLI_HOME%" mkdir "%GEMINI_CLI_HOME%"
if not exist "%GEMINI_CLI_HOME%\.gemini" mkdir "%GEMINI_CLI_HOME%\.gemini"

cd /d "%~dp0"

echo [INFO] Primary Gemini profile:
echo %GEMINI_CLI_HOME%
echo.
echo [IMPORTANT]
echo Close already running Gemini windows before this login.
echo In the browser choose the FIRST / primary Google account.
echo.

if exist "%GEMINI_CLI_HOME%\.gemini\oauth_creds.json" del /f /q "%GEMINI_CLI_HOME%\.gemini\oauth_creds.json"
if exist "%GEMINI_CLI_HOME%\.gemini\google_accounts.json" del /f /q "%GEMINI_CLI_HOME%\.gemini\google_accounts.json"

> "%GEMINI_CLI_HOME%\.gemini\settings.json" (
    echo {
    echo   "security": {
    echo     "auth": {
    echo       "selectedType": "oauth-personal"
    echo     }
    echo   }
    echo }
)

gemini

echo.
echo [INFO] Primary login finished. You can close this window.
pause
