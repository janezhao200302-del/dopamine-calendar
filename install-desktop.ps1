# Dopamine Calendar - Desktop Installer
# Run: Right-click -> "Run with PowerShell"

$appDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$vbsPath = Join-Path $appDir "launch.vbs"
$iconPath = Join-Path $appDir "icon.ico"
$desktopDir = [Environment]::GetFolderPath('Desktop')
$shortcutName = "Dopamine-Calendar.lnk"
$desktopSC = Join-Path $desktopDir $shortcutName

if (-not (Test-Path $vbsPath)) {
    Write-Host "ERROR: launch.vbs not found at: $vbsPath" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "=== Dopamine Calendar - Desktop Setup ===" -ForegroundColor Cyan
Write-Host ""

# --- Desktop shortcut ---
Write-Host "[1/2] Creating desktop shortcut..." -ForegroundColor Yellow

if (Test-Path $desktopSC) { Remove-Item $desktopSC -Force }

$ws = New-Object -ComObject WScript.Shell
$sc = $ws.CreateShortcut($desktopSC)
$sc.TargetPath = "wscript.exe"
$sc.Arguments = "`"$vbsPath`""
$sc.WorkingDirectory = $appDir
$sc.Description = "Dopamine Calendar"
$sc.IconLocation = $iconPath
$sc.Save()

Write-Host "       OK -> $desktopSC" -ForegroundColor Green

# --- Startup shortcut ---
Write-Host "[2/2] Setting up auto-start..." -ForegroundColor Yellow

$startupDir = [Environment]::GetFolderPath('Startup')
$startupSC = Join-Path $startupDir $shortcutName

if (Test-Path $startupSC) { Remove-Item $startupSC -Force }

$sc2 = $ws.CreateShortcut($startupSC)
$sc2.TargetPath = "wscript.exe"
$sc2.Arguments = "`"$vbsPath`""
$sc2.WorkingDirectory = $appDir
$sc2.Description = "Dopamine Calendar - Auto Start"
$sc2.IconLocation = $iconPath
$sc2.Save()

Write-Host "       OK -> $startupSC" -ForegroundColor Green

# --- Done ---
Write-Host ""
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host "  INSTALL COMPLETE!" -ForegroundColor Green
Write-Host ""
Write-Host "  Desktop: double-click 'Dopamine-Calendar'" -ForegroundColor Gray
Write-Host "  Auto-start: enabled on next login" -ForegroundColor Gray
Write-Host ""
Write-Host "  To uninstall: delete the desktop shortcut" -ForegroundColor Gray
Write-Host "===========================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"
