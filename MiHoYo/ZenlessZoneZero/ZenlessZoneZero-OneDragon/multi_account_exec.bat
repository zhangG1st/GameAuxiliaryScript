:: 项目地址: https://github.com/OneDragon-Anything/ZenlessZoneZero-OneDragon
:: 项目主页: https://one-dragon.com/zzz/zh/home.html

:: 启动参数
:: usage: OneDragon-Launcher.exe [-h] [-v] [-o] [-c] [-s [SHUTDOWN]] [-i INSTANCE]
:: options:
::  -h,       --help                                显示帮助信息
::  -v,       --version                             显示版本号
::  -o,       --onedragon                           一条龙运行
::  -c,       --close-game                          运行后关闭游戏
::  -s [SHUTDOWN], --shutdown [SHUTDOWN]            运行后关机，可指定延迟秒数，默认60秒
::  -i INSTANCE, --instance INSTANCE                指定运行的账号实例，多个用英文逗号分隔，如：1,2 (值得注意的是,这里的1和2是实例id, 可在"..\ZZZ-OneDragon\config\one_dragon.yml"中查看)
::                                                  (如果不想加 -i instance_list, 可以直接添加 "..\ZZZ-OneDragon\config\multi_accout.yml", 文件见当前目录中的multi_accout.yml)


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


:: 启动绝区零一条龙(一条龙运行+运行完关游戏+运行1和2账号)
cd /d "D:\Game\ZenlessZoneZero-OneDragon\ZZZ-OneDragon"
start "" /wait ".\OneDragon-Launcher.exe" -o -c -i 1,2
