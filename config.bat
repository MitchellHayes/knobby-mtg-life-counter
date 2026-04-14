@echo off
setlocal enabledelayedexpansion

:: Leggi config.mk e setta le variabili corrispondenti
if not exist "config.mk" (
    echo [ERRORE] File config.mk non trovato.
    exit /b 1
)

for /f "usebackq tokens=1* delims=:" %%a in ("config.mk") do (
    set "key=%%a"
    set "val=%%b"
    
    :: Rimuovi spazi dal nome della variabile
    set "key=!key: =!"
    
    :: Se la riga contiene := procediamo
    if "!val:~0,1!"=="=" (
        :: Estrai il valore rimuovendo il primo carattere (=) e spazi iniziali
        set "raw_val=!val:~1!"
        
        :: Trim leading spaces manually in batch
        for /f "tokens=* delims= " %%i in ("!raw_val!") do set "clean_val=%%i"
        
        :: Mappa le variabili Makefile alle variabili Batch
        if "!key!"=="PYTHON" set "P_EXE=!clean_val!"
        if "!key!"=="LLVM_BIN" set "L_BIN=!clean_val!"
    )
)

:: Esporta le variabili per gli altri script
endlocal & (
    set "PYTHON_EXE=%P_EXE%"
    set "LLVM_BIN=%L_BIN%"
    set "MAKE_EXE=%L_BIN%\mingw32-make.exe"
)
