@echo off
:: Comprobar si el script está siendo ejecutado como administrador
NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
    echo No se tiene privilegios de administrador. Reiniciando el script con privilegios elevados...
    :: Reiniciar el script como administrador
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

:: ==================== MODIFIÉ POUR %TEMP% ====================
cd /d %TEMP%

start "" "kdmapper_Release.exe" "ud.sys"

:: Optionnel : suppression après exécution (décommente si tu veux)
:: del "kdmapper_Release.exe" >nul 2>&1
:: del "ud.sys" >nul 2>&1
:: del "%~f0" >nul 2>&1

exit
