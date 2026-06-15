' launch.vbs — 多巴胺日历 桌面应用启动器
' 使用 Edge 的 --app 参数，无边框窗口，像原生程序一样
' --app 模式：无地址栏、无标签页、无浏览器 UI

Dim appDir, htmlUrl
appDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
htmlUrl = "file:///" & Replace(appDir, "\", "/") & "/index.html"

' 使用 msedge --app 打开（Windows 10/11 自带 Edge）
' 窗口模式 0 = 隐藏 VBS 自身窗口
Dim shell, cmd
Set shell = CreateObject("WScript.Shell")
cmd = "msedge --app=""" & htmlUrl & """ --new-window"
shell.Run cmd, 0, False
