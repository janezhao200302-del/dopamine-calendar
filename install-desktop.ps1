# 多巴胺日历 - 桌面快捷方式安装
# 右键 → "使用 PowerShell 运行"

$url = "https://janezhao200302-del.github.io/dopamine-calendar/"
$desktop = [Environment]::GetFolderPath('Desktop')
$shortcutPath = Join-Path $desktop "多巴胺日历.lnk"

Write-Host "正在创建桌面快捷方式..." -ForegroundColor Cyan

$ws = New-Object -ComObject WScript.Shell
$sc = $ws.CreateShortcut($shortcutPath)
$sc.TargetPath = "msedge.exe"
$sc.Arguments = "--app=`"$url`""
$sc.IconLocation = Join-Path (Split-Path -Parent $MyInvocation.Command.Path) "icon.ico"
$sc.Description = "多巴胺日历 - 日程+纪念日+农历"
$sc.Save()

Write-Host "✅ 桌面快捷方式已创建！双击打开多巴胺日历" -ForegroundColor Green
Write-Host ""
Read-Host "按 Enter 关闭"
