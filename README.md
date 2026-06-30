# Скрипты-обертки для Gemini CLI и Antigravity CLI (Windows)

Этот репозиторий содержит набор `.bat` скриптов для удобного запуска и изоляции профилей при работе с Gemini CLI (от Google) и Antigravity CLI.

Они позволяют разделить сессии авторизации (например, на **Основной** и **Дополнительный** аккаунты Google) с помощью изолированных папок профилей, избегая конфликтов авторизации.

## Описание файлов

### 1. Первичная авторизация и проверка (Основной аккаунт)
* **`geminicode-primary-login.bat`**: Сбрасывает текущую сессию для основного профиля и открывает браузер для авторизации. При авторизации выберите ваш основной аккаунт Google.
* **`geminicode-primary-check.bat`**: Запускает быстрый тестовый запрос для проверки авторизации под основным аккаунтом.
* **`geminicode-primary-fullaccess.bat`**: Запускает Gemini CLI для основного профиля с автоматическим подтверждением инструментов (`--skip-trust --approval-mode yolo`).

### 2. Вторичная авторизация и проверка (Второй аккаунт)
* **`geminicode-secondary-login.bat`**: Сбрасывает сессию для вторичного профиля и открывает браузер. Выберите "Войти в другой аккаунт" (или Use another account) и войдите во второй аккаунт Google.
* **`geminicode-secondary-check.bat`**: Запускает тестовый запрос для проверки авторизации под вторым аккаунтом.
* **`geminicode-secondary-fullaccess.bat`**: Запускает Gemini CLI для вторичного профиля с автоматическим подтверждением.

### 3. Antigravity CLI обертки
* **`geminicode.bat`** (или **`antigravity.bat`**): Запускает Antigravity CLI в обычном режиме с моделью по умолчанию (`gemini-3.5-flash-low`).
* **`geminicode-fullaccess.bat`** (или **`antigravity-fullaccess.bat`**): Запускает Antigravity CLI с автоматическим подтверждением всех действий (`--dangerously-skip-permissions`).
* **`geminicode-heavy.bat`**: Запускает Antigravity CLI с более мощной моделью (`gemini-3.1-pro`). Используйте экономно!
* **`geminicode-heavy-fullaccess.bat`**: Запускает Antigravity CLI с мощной моделью и автоподтверждением.

### 4. Codex CLI обертки (OpenAI)
* **`codex.bat`**: Запуск Codex CLI в песочнице с запросом подтверждений.
* **`codex-fullaccess.bat`**: Запуск Codex CLI в обход песочницы и автоподтверждением.

---

## Инструкция по установке и использованию для другого пользователя

1. **Скачайте этот архив** и распакуйте его в удобную папку (например, `C:\tools\bat`).
2. **Установите зависимости** (если они еще не установлены):
   * **Node.js**: Убедитесь, что на компьютере установлен Node.js.
   * **Gemini CLI**:
     ```bash
     npm install -g @google/gemini-cli@latest
     ```
   * **Antigravity CLI**: Откройте PowerShell и выполните команду:
     ```powershell
     powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://antigravity.google/cli/install.ps1 | iex"
     ```
3. **Авторизуйтесь**:
   * Для основного аккаунта запустите `geminicode-primary-login.bat` и пройдите авторизацию в браузере.
   * Для проверки работы запустите `geminicode-primary-check.bat`. Вы должны увидеть сообщение `PRIMARY_PROFILE_OK`.
   * (При необходимости) Для второго аккаунта запустите `geminicode-secondary-login.bat` и пройдите авторизацию (выбрав второй аккаунт в браузере). Для проверки запустите `geminicode-secondary-check.bat`.

4. **Запуск**:
   * Вы можете использовать эти файлы напрямую или добавить путь к этой папке в системную переменную `PATH` среды Windows, чтобы вызывать их из любого терминала в любой рабочей директории.
