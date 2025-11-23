@echo off
setlocal EnableDelayedExpansion

:: Get ESC char for ANSI colors
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a["

cls

:: Red title
echo !ESC!31m===========================================
echo               Made by fractures
echo ===========================================!ESC!0m

:: Cyan subtitle
echo !ESC!36m        Password Generator!ESC!0m
echo.

:: Yellow status
echo !ESC!33mGenerating 5 strong passwords...!ESC!0m
echo.

:: Output 5 passwords
for /l %%i in (1,1,5) do (
    powershell -NoLogo -NoProfile -command ^
    "$chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}<>?';" ^
    "$pw=-join ((1..32) | %% { $chars[(Get-Random -Minimum 0 -Maximum $chars.Length)] });" ^
    "Write-Host $pw"
)

echo.
:: Green done message
echo !ESC!32mDone!ESC!0m

pause
