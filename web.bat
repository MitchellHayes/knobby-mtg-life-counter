@echo off
pushd "%~dp0"
if not exist "config.bat" (
    echo [ERRORE] File config.bat non trovato.
    pause
    exit /b 1
)
call config.bat

echo [INFO] Compilazione simulatore Web (WASM)...
"%MAKE_EXE%" -C sim web
if %ERRORLEVEL% EQU 0 (
    echo [OK] Compilazione completata. Usa web_real.bat per avviare il simulatore.
) else (
    echo [ERRORE] Errore durante la compilazione.
)
pause
popd
