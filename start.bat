@echo off
cd /d "%~dp0"
echo Research Assistant start ho raha hai...
docker compose up -d
if errorlevel 1 (
  echo.
  echo Error: pehle Docker Desktop kholo aur "Engine running" aane do, phir dobara chalao.
  pause
  exit /b 1
)
echo App ready ho raha hai, browser 15 second mein khulega...
timeout /t 15 /nobreak >nul
start http://localhost:8501
