@echo off
pushd "%~dp0"
if not exist "config.bat" (
    echo [ERRORE] File config.bat non trovato.
    pause
    exit /b 1
)
call config.bat

echo [INFO] Avvio simulatore nativo...
"%MAKE_EXE%" -C sim sim-gui
if %ERRORLEVEL% EQU 0 (
    start "" "sim/knobby_sim_gui.exe"
) else (
    echo [ERRORE] Errore durante la compilazione del simulatore.
    pause
)
popd
