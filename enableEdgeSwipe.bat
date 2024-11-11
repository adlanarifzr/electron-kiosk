@echo off
:: Enable Edge Swipe in Windows

:: Check if AllowEdgeSwipe item exists
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v AllowEdgeSwipe >nul 2>&1
if %errorlevel% eq 0 (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v AllowEdgeSwipe /t REG_DWORD /d 1 /f
    echo AllowEdgeSwipe value set to 1
) else (
    echo AllowEdgeSwipe item does not exist, nothing to change
)

pause