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


:: 启动原神官服（进入游戏目录下运行YuanShen.exe,跑的是本体下载的服； 在游戏目录外启动的是官服(默认)； 本质上是用不同config启动）
start "" "D:\Game\Genshin\Genshin Impact bilibili\games\Genshin Impact Game\YuanShen.exe"

:: 延时25秒（根据需求调整数字）
ping 127.0.0.1 -n 25 >nul

:: 再启动bgi  (/wait 阻塞后续命令) （取巧操作：bgi要求开启用时登录游戏, 当游戏没有启动时，bgi会帮你启动。这里是先启动了游戏，不然bgi会进YuanShen.exe的目录中启动本体安装的服）
start "" /wait "D:\Game\BetterGI\BetterGI\BetterGI.exe" startOneDragon "官服清日常"


:: 米游社签到 （起隔离作用，不然bgi会冲突）
cd /d "D:\Game\MihoyoBBS\MihoyoBBSTools-master"
start "" /wait python "main.py"


:: 延时5秒（根据需求调整数字）
ping 127.0.0.1 -n 5 >nul

:: 等米游社签到结束后，再zzz一条龙
cd /d "D:\Game\ZenlessZoneZero-OneDragon\ZZZ-OneDragon"
start "" /wait ".\OneDragon-Launcher.exe" -o -c


:: 延时25秒（根据需求调整数字）
ping 127.0.0.1 -n 25 >nul

:: 等待上诉应用程序结束，再预定bgi 
start "" /wait "D:\Game\BetterGI\BetterGI\BetterGI.exe" startOneDragon "默认配置"