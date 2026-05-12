:: 项目地址: https://github.com/YueHen14/skyland-auto-sign
:: 当执行“pip install -r requirements.txt”时报“Could not fetch URL https://pypi.org/simple/cryptography/”，请更换镜像，可以执行“pip install cryptography -i https://pypi.tuna.tsinghua.edu.cn/simple”


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
cd /d "D:\Game\Skyland\skyland-auto-sign"
start "" /wait python "src\main.py"
