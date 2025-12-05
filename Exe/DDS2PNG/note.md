## 安装ImageMagick
[ImageMagick官网下载链接](https://imagemagick.org/script/download.php#windows)

下载这一项（必须带 dll / legacy utilities）：**ImageMagick-7.1.*-Q16-HDRI-x64-dll.exe**

安装时一定勾选：

+ [✓] Add application directory to your system PATH

+ [✓] Install legacy utilities (e.g. convert)

+ [✓] Install development headers & libraries

⚠️ 如果不勾选 PATH 或 legacy，那么 bat 脚本将无法运行。

## 测试ImageMagick是否安装成功
```bash
magick -version
```
如果显示版本号 = 安装成功。

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


