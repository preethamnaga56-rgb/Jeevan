@echo off
cd /d "%~dp0"
echo Starting Jeevan dev server on http://localhost:3000/ ...
"C:\Users\laxmi\AppData\Local\ms-playwright-go\1.57.0\node.exe" "node_modules\vite\bin\vite.js"
pause
