# 多巴胺日历 Windows 桌面程序
# 双击运行，原生窗口体验

$url = "https://janezhao200302-del.github.io/dopamine-calendar/"

# 加载 Windows Forms 和 WebView2
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$appDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# 创建窗口
$form = New-Object System.Windows.Forms.Form
$form.Text = "多巴胺日历"
$form.Size = New-Object System.Drawing.Size(1100, 750)
$form.StartPosition = "CenterScreen"
$form.MinimumSize = New-Object System.Drawing.Size(400, 500)

# 设置图标
$iconPath = Join-Path $appDir "icon.ico"
if (Test-Path $iconPath) {
    $form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($iconPath)
}

# 创建 WebView2 控件
$webView = New-Object Microsoft.Web.WebView2.WinForms.WebView2
$webView.Dock = "Fill"
$webView.Source = New-Object System.Uri($url)

# WebView2 初始化
$webView.CoreWebView2InitializationCompleted += {
    $webView.CoreWebView2.Settings.IsPasswordAutosaveEnabled = $false
}

# 异步初始化
$webView.EnsureCoreWebView2Async($null)

$form.Controls.Add($webView)

# 关闭时清理
$form.Add_FormClosing({
    $webView.Dispose()
})

Write-Host "多巴胺日历正在启动..." -ForegroundColor Green
$form.ShowDialog() | Out-Null
