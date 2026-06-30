@echo off
setlocal EnableExtensions

title Gemini CLI - Login Secondary Account

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
if not exist "%GEMINI_CLI_HOME%\.gemini" mkdir "%GEMINI_CLI_HOME%\.gemini"

cd /d "%~dp0"

echo [INFO] Secondary Gemini profile:
echo %GEMINI_CLI_HOME%
echo.
echo [IMPORTANT]
echo Close any already running Gemini Full Access windows before this login.
echo They can keep the current OAuth session active while we are trying to bind
echo an isolated secondary profile.
echo.
echo Google may auto-select the account already active in your browser.
echo In the browser login page choose:
echo   Use another account
echo then sign in with the SECOND Google account.
echo.
echo If it already picked the wrong account, this script will reset only
echo the secondary Gemini profile before trying again.
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
echo [INFO] Secondary login finished. You can close this window.
pause
