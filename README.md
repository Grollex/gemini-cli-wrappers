# CLI wrappers for Gemini CLI, Antigravity and Codex (Windows)

Small `.bat` launchers I use to run AI coding CLIs on Windows. The main point is running Gemini CLI under two Google accounts: each account gets its own profile folder (`gemini-profiles\primary` and `gemini-profiles\secondary` next to the scripts), so the sign-ins don't overwrite each other.

## Files

**Gemini CLI, two accounts**

| File | What it does |
|---|---|
| `geminicode-primary-login.bat` | resets the primary profile and opens the browser to sign in |
| `geminicode-primary-check.bat` | sends a quick test prompt; prints `PRIMARY_PROFILE_OK` if the sign-in works |
| `geminicode-primary-fullaccess.bat` | starts Gemini CLI on the primary profile with `--skip-trust --approval-mode yolo` |
| `geminicode-secondary-*.bat` | the same three for a second account (pick "Use another account" in the browser) |

**Antigravity CLI** (the `geminicode*.bat` files without `primary`/`secondary` in the name start Antigravity, not Gemini CLI)

| File | What it does |
|---|---|
| `geminicode.bat` / `antigravity.bat` | normal mode, default model `gemini-3.5-flash-low` |
| `geminicode-fullaccess.bat` / `antigravity-fullaccess.bat` | approves everything automatically (`--dangerously-skip-permissions`) |
| `geminicode-heavy.bat` | stronger model `gemini-3.1-pro`, uses more quota |
| `geminicode-heavy-fullaccess.bat` | stronger model with automatic approval |

**Codex CLI**

| File | What it does |
|---|---|
| `codex.bat` | runs in the sandbox and asks before actions |
| `codex-fullaccess.bat` | no sandbox, automatic approval |

## Setup

1. Put the files in a folder, for example `C:\tools\bat`. Add the folder to `PATH` if you want the commands to work from any terminal.
2. Install what you need:
   - Node.js
   - Gemini CLI: `npm install -g @google/gemini-cli@latest`
   - Antigravity CLI, in PowerShell:
     ```powershell
     powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://antigravity.google/cli/install.ps1 | iex"
     ```
   - Codex CLI, if you use the Codex wrappers
3. Sign in: run `geminicode-primary-login.bat`, then `geminicode-primary-check.bat`. For a second account do the same with the `secondary` files.

The `fullaccess` variants let the agent edit files and run commands without asking. Use them only in folders you trust it with.

## По-русски

Набор `.bat`-скриптов для запуска Gemini CLI под двумя Google-аккаунтами (у каждого своя папка профиля), а также Antigravity CLI и Codex CLI. Таблицы выше: что делает каждый файл. Установка: Node.js, Gemini CLI (`npm install -g @google/gemini-cli@latest`), затем `geminicode-primary-login.bat` и проверка `geminicode-primary-check.bat`.
