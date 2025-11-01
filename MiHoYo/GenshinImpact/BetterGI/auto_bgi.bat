:: Better GI主页: https://bettergi.com
:: 具体配置见 https://bettergi.com/feats/command/introduce.html



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


start "" /wait "D:\Game\BetterGI\BetterGI\BetterGI.exe" startOneDragon "<默认配置>"