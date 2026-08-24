@echo off
title 一键安装 Node.js 和 Git

echo ========================================
echo     正在安装 Node.js (LTS) 和 Git
echo ========================================
echo.

:: 检查 winget 是否可用
winget --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到 winget，请确保系统为 Windows 10/11 并已安装应用安装程序。
    pause
    exit /b 1
)

:: 1. 安装 Node.js (LTS)[reference:0][reference:1][reference:2]
echo [1/2] 正在安装 Node.js (LTS) ...
winget install --id OpenJS.NodeJS.LTS --exact --silent --accept-package-agreements --accept-source-agreements
if errorlevel 1 (
    echo [警告] Node.js 安装可能失败，请检查网络或手动安装。
) else (
    echo [完成] Node.js 安装成功。
)

:: 2. 安装 Git[reference:3][reference:4][reference:5]
echo [2/2] 正在安装 Git ...
winget install --id Git.Git --exact --silent --accept-package-agreements --accept-source-agreements
if errorlevel 1 (
    echo [警告] Git 安装可能失败，请检查网络或手动安装。
) else (
    echo [完成] Git 安装成功。
)

echo.
echo ========================================
echo     安装过程已结束！
echo     请关闭此窗口，然后重新打开终端生效。
echo ========================================
pause