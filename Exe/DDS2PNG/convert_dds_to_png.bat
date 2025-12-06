:: 实现功能：将该脚本所在目录中的所有.dds文件都转换为png格式，并输出在./file目录下


@echo off
:: 设置代码页为UTF-8
chcp 65001

:: 注意请不要使用管理员身份运行，否则转换可能不成功
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
set OUTDIR=file
:: 设置magick的路径
set m="D:\SoftwarePro\ImageMagick\ImageMagick-7.1.2-Q16-HDRI\magick.exe"

:: 如果输出目录不存在则创建
if not exist "%OUTDIR%" mkdir "%OUTDIR%"

echo ==========================================
echo   DDS → PNG 批量转换（ImageMagick for Windows）
echo ==========================================
echo.

for %%f in (*.dds) do (
    echo [转换] %%f
    %m% "%%f" "%OUTDIR%\%%~nf.png"
)

echo ==========================================
echo   完成！PNG 文件已保存在 %OUTDIR%
echo ==========================================
pause
