:: 项目地址: https://github.com/Womsxd/MihoyoBBSTools
:: 最好关掉BBS模块(mihoyobbs.enable: false)




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


:: 启动App
cd /d "D:\Game\MihoyoBBS\MihoyoBBSTools-master"
start "" /wait python "main.py"