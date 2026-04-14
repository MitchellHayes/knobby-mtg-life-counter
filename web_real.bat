@echo off
pushd "%~dp0"
if not exist "config.bat" (
    echo [ERRORE] File config.bat non trovato.
    pause
    exit /b 1
)
call config.bat

echo [INFO] Avvio server web locale per il simulatore Knobby...
echo [INFO] Premi Ctrl+C per fermare il server.
start "" "http://localhost:8000/sim/index.html"
"%PYTHON_EXE%" -m http.server 8000
popd
