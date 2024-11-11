@echo off
:: Disable Edge Swipe in Windows

:: Step 1: Check if the registry path exists; if not, create it
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" >nul 2>&1
if %errorlevel% neq 0 (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /f
    echo Created registry path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI
) else (
    echo Registry path already exists: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI
)

:: Step 2: Check if AllowEdgeSwipe item exists; if not, create it as 32-bit DWORD with value 0
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v AllowEdgeSwipe >nul 2>&1
if %errorlevel% neq 0 (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v AllowEdgeSwipe /t REG_DWORD /d 0 /f
    echo Created AllowEdgeSwipe item with value 0
) else (
    echo AllowEdgeSwipe item already exists
)

echo Edge Swipe disabled successfully
pause