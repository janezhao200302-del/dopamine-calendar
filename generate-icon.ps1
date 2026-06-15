# Generate mint-green calendar icon
Add-Type -AssemblyName System.Drawing

$iconPath = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "icon.ico"
$size = 64

$bmp = New-Object System.Drawing.Bitmap($size, $size)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'HighQuality'
$g.Clear([System.Drawing.Color]::FromArgb(0, 0, 0, 0))  # transparent

# Mint green rounded rect background
$mint = [System.Drawing.Color]::FromArgb(255, 126, 200, 160)
$darkMint = [System.Drawing.Color]::FromArgb(255, 90, 165, 125)
$white = [System.Drawing.Color]::White

# Draw rounded rectangle body
$brush = New-Object System.Drawing.SolidBrush($mint)
$pen = New-Object System.Drawing.Pen($darkMint, 2)
$rect = New-Object System.Drawing.Rectangle(4, 12, 56, 48)
$g.FillRectangle($brush, $rect)
$g.DrawRectangle($pen, $rect)

# Draw white header strip (calendar page top)
$whiteBrush = New-Object System.Drawing.SolidBrush($white)
$headerRect = New-Object System.Drawing.Rectangle(4, 12, 56, 14)
$g.FillRectangle($whiteBrush, $headerRect)
$g.DrawRectangle($pen, $headerRect)

# Draw two red binding rings
$redBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(255, 230, 100, 100))
$g.FillEllipse($redBrush, 20, 2, 10, 10)
$g.FillEllipse($redBrush, 34, 2, 10, 10)

# Draw checkmark in the body area
$checkPen = New-Object System.Drawing.Pen($white, 3.5)
$checkPen.StartCap = 'Round'
$checkPen.EndCap = 'Round'
$points = @(
    [System.Drawing.Point]::new(18, 36),
    [System.Drawing.Point]::new(28, 47),
    [System.Drawing.Point]::new(48, 26)
)
$g.DrawLines($checkPen, $points)

$g.Dispose()
$bmp.Save($iconPath, [System.Drawing.Imaging.ImageFormat]::Icon)
$bmp.Dispose()

Write-Host "Icon created: $iconPath" -ForegroundColor Green
