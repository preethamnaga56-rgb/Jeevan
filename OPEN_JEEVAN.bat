@echo off
setlocal
title Jeevan Patient Health Record Launcher
echo ========================================================
echo          JEEVAN HEALTH PLATFORM LAUNCHER
echo ========================================================
echo.

cd /d "C:\Users\laxmi\.gemini\antigravity-ide\scratch\jeevan"

echo Checking if Jeevan server is running on port 3000...
netstat -ano | findstr :3000 | findstr LISTENING >nul
if %errorlevel% equ 0 (
    echo [OK] Jeevan server is already active!
) else (
    echo [STARTING] Starting Jeevan development server...
    start "Jeevan Dev Server" /min "C:\Users\laxmi\AppData\Local\ms-playwright-go\1.57.0\node.exe" "node_modules\vite\bin\vite.js"
    echo Waiting for server to initialize...
    ping -n 4 127.0.0.1 >nul
)

echo.
echo [LAUNCHING] Opening http://localhost:3000/ in your browser...
start http://localhost:3000/
echo.
echo App opened successfully!
ping -n 3 127.0.0.1 >nul
exit
