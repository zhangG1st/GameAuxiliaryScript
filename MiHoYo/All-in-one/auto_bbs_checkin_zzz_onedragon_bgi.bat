@echo off
:: 设置代码页为UTF-8
chcp 65001

::管理员权限检测
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    echo 请右键以管理员身份运行此脚本！
    pause
    exit
)

:: 先米游社签到
cd /d "D:\Game\MihoyoBBS\MihoyoBBSTools-master"
start "" /wait python "main.py"

:: 延时5秒（根据需求调整数字）
ping 127.0.0.1 -n 5 >nul

:: 等米游社签到结束后，再zzz一条龙
cd /d "D:\Game\ZenlessZoneZero-OneDragon\ZZZ-OneDragon"
start "" /wait ".\OneDragon-Launcher.exe" -o -c

:: 延时5秒（根据需求调整数字）
ping 127.0.0.1 -n 5 >nul


:: 等待上诉应用程序结束，再预定bgi
start "" /wait "D:\Game\BetterGI\BetterGI\BetterGI.exe" startOneDragon "默认配置"


:: 10分钟后关机(可选择关机)
:: shutdown.exe /s /t 600