## 安装ImageMagick
[ImageMagick官网下载链接](https://imagemagick.org/script/download.php#windows)

下载这一项（必须带 dll / legacy utilities）：**ImageMagick-7.1.*-Q16-HDRI-x64-dll.exe**

安装时一定勾选：

+ [✓] Add application directory to your system PATH

+ [✓] Install legacy utilities (e.g. convert)

+ [✓] Install development headers & libraries

⚠️ 如果不勾选 PATH 或 legacy，那么 bat 脚本将无法运行。


<br/>
<br/>


## 测试ImageMagick是否安装成功
```bash
magick -version
```
如果显示版本号 = 安装成功。

<br/>
<br/>

## 测试DDS支持
把任意一张 `.dds` 放在当前目录，执行：
```bash
magick identify test.dds
```
能输出图片信息 → DDS 支持正常。
如果报错"No delegate for this format" → 缺少 DDS 支持。




<br/>
<br/>






## 使用管理员身份运行`.bat`时，ImageMagick（magick.exe）的 PATH 环境变量不能正确继承 → 命令找不到 → 转换失败。


这是 Windows 的一个常见坑：


## 🟥 为什么管理员模式会导致失败？


+ 普通用户的 PATH ≠ 管理员的 PATH

+ 你安装 ImageMagick 时注册的 PATH 只写入了“当前用户”

+ 管理员账号没有对应的 PATH 项

+ 所以管理员模式下运行 .bat 时找不到 magick 命令



<br/>
<br/>

## 解决方案

### 方案A： 不使用管理员身份运行
### 方案B: 让管理员也能使用 magick
1. 给系统 PATH 也加入 ImageMagick 路径:  
   WIN + R
   ```bash 
   SystemPropertiesAdvanced
   ```
2. 点击「环境变量」

3. 选 `系统变量(System`) 下的 `Path`（不是 用户变量）

4. 添加你的 ImageMagick 安装路径。
   
   添加后管理员和普通用户都会有这个 `PATH`。


<br/>
<br/>


## 命令行参数

| 参数 | 功能说明 | 示例 |
|------|----------|-------|
| -flip | 垂直翻转（上下颠倒） | magick in.png -flip out.png |
| -flop | 水平翻转（左右镜像） | magick in.png -flop out.png |
| -rotate X | 旋转图像（角度） | magick in.png -rotate 90 out.png |
| -resize WxH | 缩放图片 | magick in.png -resize 800x600 out.png |
| -resize 50% | 按百分比缩放 | magick in.png -resize 50% out.png |
| -scale WxH | 快速缩放（低质量） | magick in.png -scale 200x200 out.png |
| -thumbnail WxH | 缩略图（保持高质量） | magick in.jpg -thumbnail 300x300 out.jpg |
| -crop WxH+X+Y | 裁剪区域 | magick in.jpg -crop 200x200+50+50 out.jpg |
| -extent WxH | 扩展画布 | magick in.jpg -extent 1024x1024 out.jpg |
| -gravity Center | 设置对齐位置 | magick in.png -gravity Center -extent 800x800 out.png |
| -background color | 设置背景色 | magick in.png -background black -rotate 45 out.png |
| -border X | 添加边框 | magick in.png -border 10 -bordercolor red out.png |
| -bordercolor color | 设置边框颜色 | 同上 |
| -fill color | 设置绘图/文字颜色 | magick in.png -fill red -draw ... |
| -stroke color | 设置描边颜色 | magick ... -stroke black ... |
| -strokewidth N | 描边宽度 | magick ... -strokewidth 2 ... |
| -draw "指令" | 绘制图形 | magick in.png -draw "line 0,0 100,100" out.png |
| -annotate XxY text | 添加文字 | magick in.png -annotate +100+50 "Hello" out.png |
| -font 字体 | 指定字体 | magick in.png -font Arial -annotate ... |
| -pointsize N | 设置字号 | magick in.png -pointsize 40 -annotate ... |
| -kerning N | 设置文字字距 | magick ... -kerning 3 ... |
| -interline-spacing N | 行间距 | magick ... -interline-spacing 10 ... |
| -fill color | 填充色 | magick ... -fill #FF0000 ... |
| -opaque color | 替换指定颜色 | magick in.png -opaque white out.png |
| -alpha on/off | 启用/关闭 alpha | magick in.png -alpha off out.png |
| -alpha remove | 移除 alpha 通道 | magick in.png -alpha remove out.png |
| -alpha extract | 提取 alpha 通道 | magick in.png -alpha extract mask.png |
| -alpha background | 用背景填充透明 | magick in.png -alpha background out.jpg |
| -channel RGB | 指定颜色通道 | magick in.png -channel R -separate R.png |
| -separate | 分离通道 | magick in.png -separate out_%d.png |
| -combine | 合并通道 | magick R.png G.png B.png -combine rgb.png |
| -modulate B,S,H | 调整亮度/饱和/色调 | magick in.png -modulate 120,150,100 out.png |
| -brightness-contrast BxC | 调亮 / 对比度 | magick in.png -brightness-contrast 20x30 out.png |
| -gamma N | 调整伽玛 | magick in.png -gamma 1.2 out.png |
| -level BxWxG | 调整色阶 | magick in.png -level 10%,90% out.png |
| -normalize | 自动归一化对比度 | magick in.png -normalize out.png |
| -equalize | 自动均衡色阶 | magick in.png -equalize out.png |
| -colorspace RGB | 转换颜色空间 | magick in.png -colorspace Gray out.png |
| -grayscale Rec709 | 灰度转换（多种方法） | magick in.png -grayscale Rec709 out.png |
| -contrast | 增加对比度 | magick in.png -contrast out.png |
| -contrast-stretch | 对比度拉伸 | magick in.png -contrast-stretch 5%x5% out.png |
| -blur X | 高斯模糊 | magick in.png -blur 0x3 out.png |
| -gaussian-blur X | 高斯模糊（扩展） | 同上 |
| -motion-blur | 动态模糊 | magick in.png -motion-blur 0x20+45 out.png |
| -radial-blur | 放射模糊 | magick in.png -radial-blur 20 out.png |
| -sharpen X | 图像锐化 | magick in.png -sharpen 0x1 out.png |
| -unsharp X | USM 锐化 | magick in.png -unsharp 0x2 out.png |
| -threshold X% | 阈值二值化 | magick in.png -threshold 50% out.png |
| -dither FloydSteinberg | 抖动 | magick in.png -dither FloydSteinberg out.png |
| -posterize N | 降低色阶 | magick in.png -posterize 8 out.png |
| -negate | 颜色反转 | magick in.png -negate out.png |
| -solarize X% | 曝光效果 | magick in.png -solarize 50% out.png |
| -sepia-tone N% | 棕褐色效果 | magick in.png -sepia-tone 80% out.png |
| -charcoal X | 炭笔效果 | magick in.png -charcoal 2 out.png |
| -sketch X | 素描效果 | magick in.png -sketch 0x20 out.png |
| -emboss X | 浮雕 | magick in.png -emboss 1 out.png |
| -edge X | 边缘检测 | magick in.png -edge 1 out.png |
| -canny X | Canny 边缘 | magick in.png -canny 0x1+10%+30% out.png |
| -implode X | 内吸变形 | magick in.png -implode 0.5 out.png |
| -vignette XxY | 暗角效果 | magick in.png -vignette 10x20 out.png |
| -colorize R,G,B | 上色 | magick in.png -colorize 20,0,0 out.png |
| -tint X% | 色调覆盖 | magick in.png -fill blue -tint 50% out.png |
| -hue X | 设置色调 | magick in.png -hue 120 out.png |
| -saturation X | 饱和度 | magick in.png -saturation 150 out.png |
| -brightness X | 亮度 | magick in.png -brightness 120 out.png |
| -quality N | 设置输出质量（JPEG/WebP） | magick in.jpg -quality 90 out.jpg |
| -format png/jpg | 输出格式 | magick in.png -format jpg out.jpg |
| -define webp:lossless=true | WebP 无损 | magick in.png -define webp:lossless=true out.webp |
| -define png:compression-level=9 | PNG 压缩率 | magick in.png -define png:compression-level=9 out.png |
| -strip | 移除元数据 | magick in.jpg -strip out.jpg |
| -sampling-factor X | JPEG 色度采样 | magick in.jpg -sampling-factor 4:4:4 out.jpg |
| -depth N | 设置位深 | magick in.png -depth 8 out.png |
| -write 图片 | 中途输出 | magick in.png (...) -write mid.png out.png |
| -verbose | 显示详细执行信息 | magick -verbose in.png out.png |
| -debug all | 输出调试信息 | magick -debug all in.png out.png |
| -identify | 显示图像信息 | magick identify in.png |
| -list format | 列出支持的格式 | magick -list format |
| -list font | 列出字体 | magick -list font |
| -list color | 列出颜色名 | magick -list color |
| -list delegate | 外部解码器 | magick -list delegate |
| -list command | 支持的命令 | magick -list command |
| -list type | 列出所有可用类型 | magick -list type |
| -quiet | 关闭警告 | magick -quiet in.png out.png |
| -trim | 去除背景边缘 | magick in.png -trim out.png |
| -fuzz X% | 模糊颜色匹配 | magick in.png -fuzz 10% -transparent white out.png |
| -transparent color | 将颜色设为透明 | magick in.png -transparent black out.png |
| -monochrome | 黑白图像 | magick in.png -monochrome out.png |
| -type Grayscale | 强制灰度 | magick in.jpg -type Grayscale out.jpg |
| -type TrueColor | 强制真彩 | magick in.jpg -type TrueColor out.jpg |
| -morph N | 图像合成过渡 | magick in1.png in2.png -morph 10 out_%d.png |
| -composite | 图像合成 | magick bg.png fg.png -composite out.png |
| -compose Over | 设置合成模式 | magick ... -compose Multiply -composite out.png |
| -tile X | 平铺模式 | magick tile.png -size 800x800 tile: out.png |
| -duplicate N | 复制图层 | magick in.png -duplicate 3 out.png |
| -reverse | 反转图层顺序 | magick a b c -reverse out.png |
| -append | 垂直拼接 | magick a.png b.png -append out.png |
| +append | 水平拼接 | magick a.png b.png +append out.png |



