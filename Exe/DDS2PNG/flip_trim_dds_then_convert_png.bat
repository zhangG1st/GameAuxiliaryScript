@echo off
:: 设置代码页为UTF-8
chcp 65001

:: 注意请不要使用管理员身份运行，否则转换不成功
@REM ::管理员权限检测
@REM NET SESSION >nul 2>&1
@REM if %errorlevel% neq 0 (
@REM     echo 请右键以管理员身份运行此脚本！
@REM     pause
@REM     exit
@REM )

setlocal enabledelayedexpansion

:: 输出目录
:: 当前目录下的file
set OUTDIR=Transparent
:: 设置magick的路径
set m="D:\SoftwarePro\ImageMagick\ImageMagick-7.1.2-Q16-HDRI\magick.exe"


if not exist "%OUTDIR%" mkdir "%OUTDIR%"

echo ==========================================
echo   DDS垂直翻转 + 去除背景边缘 + 转为 PNG
echo ==========================================
echo.

for %%f in (*.dds) do (
    echo [处理中] %%f
    :: -flip 垂直翻转
    :: -trim 去除背景边缘
    %m% "%%f" -flip -trim "%OUTDIR%\%%~nf.png"
)

echo ==========================================
echo   完成！已翻转并转换为PNG
echo   输出目录：%OUTDIR%
echo ==========================================
pause

