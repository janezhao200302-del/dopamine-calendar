@echo off
chcp 65001 >nul
title 多巴胺日历 安装程序

echo.
echo ================================================
echo   多巴胺日历 — 桌面版安装
echo ================================================
echo.

:: 检查 Edge
where msedge >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未找到 Microsoft Edge 浏览器
    echo 请先安装 Edge: https://www.microsoft.com/edge
    pause
    exit /b 1
)

set "URL=https://janezhao200302-del.github.io/dopamine-calendar/"
set "APP_DIR=%~dp0"
set "ICON=%APP_DIR%icon.ico"

:: 创建桌面快捷方式
set "DESKTOP=%USERPROFILE%\Desktop"
set "SHORTCUT=%DESKTOP%\多巴胺日历.lnk"

echo [1/2] 创建桌面快捷方式...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%SHORTCUT%'); $sc.TargetPath = 'msedge.exe'; $sc.Arguments = '--app=\"%URL%\" --window-size=1100,750'; if (Test-Path '%ICON%') { $sc.IconLocation = '%ICON%' }; $sc.Description = '多巴胺日历'; $sc.Save()"

echo [2/2] 设置开机自启动...

set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "STARTUP_SC=%STARTUP%\多巴胺日历.lnk"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$ws = New-Object -ComObject WScript.Shell; $sc = $ws.CreateShortcut('%STARTUP_SC%'); $sc.TargetPath = 'msedge.exe'; $sc.Arguments = '--app=\"%URL%\"'; if (Test-Path '%ICON%') { $sc.IconLocation = '%ICON%' }; $sc.Save()"

echo.
echo ================================================
echo   安装完成！
echo.
echo   桌面已生成「多巴胺日历」图标，双击打开
echo   下次开机自动启动
echo ================================================
echo.
pause
