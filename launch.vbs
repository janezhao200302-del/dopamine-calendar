' 多巴胺日历桌面启动器
' 用 Edge 应用模式打开（无边框、无地址栏，像原生程序）

Dim url
url = "https://janezhao200302-del.github.io/dopamine-calendar/?v=999"

CreateObject("WScript.Shell").Run "msedge --app=""" & url & """", 0, False
