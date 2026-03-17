@echo off
:: ==== Chrome 静默打印设置脚本 ====
:: 查找 Chrome 默认路径
set "chromePath=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%chromePath%" set "chromePath=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not exist "%chromePath%" (
    echo  未找到 Chrome，请确认是否已安装。
    pause
    exit /b
)

:: 在桌面创建一个新的 Chrome 快捷方式，带 --kiosk-printing 参数
set "shortcut=%USERPROFILE%\Desktop\Chrome_Silent_Print.lnk"

echo 创建快捷方式：%shortcut%
powershell -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%shortcut%');$s.TargetPath='%chromePath%';$s.Arguments='--kiosk-printing';$s.IconLocation='%chromePath%,0';$s.Save()"

echo √ 已完成！请使用桌面上的 [Chrome_Silent_Print] 启动浏览器。
echo   用该浏览器运行页面时，前端 iframe.contentWindow.print() 将自动静默打印。
pause