@echo off

set /p proxyIP="Input proxy IP address:__"


set proxyIP=192.168.1.18
set proxyPort=7890
set proxyURL=http://%proxyIP%:%proxyPort%


:: netsh winhttp set proxy <proxy>:<port>
:: netsh winhttp set proxy 10.0.0.6:8080
netsh winhttp set proxy 192.168.1.18:7890


:: Windows 10 系统优化脚本大全 - 奔跑的蜗牛
:: https://www.cnblogs.com/MeiCheng/p/10463408.html
:: posted @ 2019-03-02

goto label

---- 必要的
关闭Windows Defender
关闭Windows防火墙
关闭用户账户控制(UAC)
关闭Smartscreen应用筛选器
启动电源计划“高性能”
关闭显示器前等待时间: 从不
关闭休眠
延迟启动 Superfetch 服务
禁止运行计算机自动维护计划
关闭客户体验改善计划
关闭自动播放
关机时强制杀后台不等待
关闭远程协助
任务栏日期显示“星期几”
关闭磁盘碎片整理计划
禁用疑难解答和系统诊断服务
启用防火墙Windows Firewall服务（并非启用防火墙）
删除回收站右键固定到开始屏幕
关闭Windows10 要使用本计算机，用户必需输入用户名和密码
关闭家庭组
隐藏资源管理器导航窗格家庭组和网络
关闭开机画面

禁用"最近使用的项目“
开启“快速启动”
关闭程序兼容性助手
关闭不必要的视觉动画效果
关闭不需要的视觉效果
IE11开启企业模式
开始屏幕自动显示"应用"视图
清除右键多余菜单
打开IE请勿追踪功能(Do Not Track)
设置窗口超窄边框
禁止一联网就打开浏览
禁用任务计划程序自启项
去除快捷方式小箭头和后缀
去除UAC小盾牌
Win10去掉桌面箭头
Win10恢复桌面箭头


---- 可选的


---- 不需要的

:label



:: 关闭Windows Defender
@ECHO off
ECHO 关闭Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo 完成


:: 关闭Windows防火墙
ECHO 关闭Windows防火墙
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
sc stop MpsSvc MpsSvc & sc config MpsSvc start=disabled
echo 完成


::关闭用户账户控制(UAC)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 0 /t REG_DWORD /f
echo 完成


:: 关闭Smartscreen应用筛选器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
echo 完成


:: 启动电源计划“高性能”
powercfg.exe -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo 完成


:: 关闭显示器前等待时间: 从不
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
echo 完成


:: 关闭休眠
powercfg -h off
echo 完成


:: 延迟启动 Superfetch 服务
sc config "SysMain" start= delayed-auto
echo 完成


:: 禁止运行计算机自动维护计划
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /d 0 /t REG_DWORD /f
echo 完成


:: 关闭客户体验改善计划
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
echo 完成


:: 关闭自动播放
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 255 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 255 /t REG_DWORD /f
echo 完成


:: 关机时强制杀后台不等待
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
echo 完成


:: 关闭远程协助
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /d 0 /t REG_dword /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDenyTSConnections" /d 1 /t REG_dword /f
echo 完成


:: 任务栏日期显示“星期几”
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sLongDate" /d "yyyy'年'M'月'd'日', dddd" /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v "sShortDate" /d "yyyy/M/d/ddd" /t REG_SZ /f
echo 完成


:: 关闭磁盘碎片整理计划
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
echo 完成


:: 禁用疑难解答和系统诊断服务
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop DPS
sc config DPS start= disabled
sc config WdiServiceHost start= disabled
sc config WdiSystemHost start= disabled
echo 完成


:: 启用防火墙Windows Firewall服务（并非启用防火墙）
ECHO 启用防火墙Windows Firewall服务（并非启用防火墙）
sc config MpsSvc start= auto 
net start MpsSvc
echo 完成


:: 删除回收站右键固定到开始屏幕
ECHO 删除回收站右键固定到开始屏幕
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f
echo 完成


:: 关闭Windows10 要使用本计算机，用户必需输入用户名和密码
ECHO 关闭Windows10 要使用本计算机，用户必需输入用户名和密码
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v AutoAdminLogon /d 1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultUserName /d Administrator
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultDomainName /d My pc
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v DefaultPassword /d 1234
echo 完成


:: 关闭家庭组
ECHO 关闭家庭组
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /d 1 /t REG_DWORD /f
echo 完成


:: 隐藏资源管理器导航窗格家庭组和网络
ECHO 隐藏资源管理器导航窗格家庭组和网络
reg add "HKEY_CLASSES_ROOT\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v Attributes /d 2962489612 /t REG_DWORD /f
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v Attributes /d 2962489444 /t REG_DWORD /f
echo 完成


:: 关闭开机画面
ECHO 关闭开机画面
bcdedit /set quietboot on
echo 完成


:: 禁用"最近使用的项目“
ECHO 禁用"最近使用的项目"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /t REG_BINARY /f
reg add "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PastIconsStream" /t REG_BINARY /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRecentDocsHistory" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInstrumentation" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchHistory" /d 1 /t REG_DWORD /f
echo 完成


:: 开启“快速启动”
ECHO 开启“快速启动”
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "HiberbootEnabled" /d 1 /t REG_DWORD /f
echo 完成


:: 关闭程序兼容性助手
ECHO 关闭程序兼容性助手
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
echo 完成


:: 关闭不必要的视觉动画效果
ECHO 关闭不必要的视觉动画效果
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\DWM" /v "DisallowAnimations" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /d 1 /t REG_dword /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
echo 完成


:: 关闭不需要的视觉效果
ECHO 关闭不需要的视觉效果
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 3 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "DragFullWindows" /d 1 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /d "9012038010000000" /t REG_BINARY /f
echo 完成


:: IE11开启企业模式
ECHO IE11开启企业模式
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /v SiteList /d "HKCU\Software\policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Main\EnterpriseMode" /v Enable /d "" /t reg_sz /f
echo 完成


:: 开始屏幕自动显示"应用"视图
ECHO 开始屏幕自动显示"应用"视图
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 1 /t REG_DWORD /f
echo 完成


:: 清除右键多余菜单
ECHO 清除右键多余菜单
regsvr32 /u /s igfxpph.dll
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers /f
reg add HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\new /ve /d {D969A300-E7FF-11d0-A93B-00A0C90F2719}
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeysCmds /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
echo 完成


:: 打开IE请勿追踪功能(Do Not Track)
ECHO 打开IE请勿追踪功能(Do Not Track)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "DoNotTrack" /d "1" /t REG_DWORD /f
taskkill /f /im iexplore.exe
ECHO 完成


:: 设置窗口超窄边框
ECHO 设置窗口超窄边框
reg add "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d 0 /t REG_SZ /f
echo 完成


:: 禁止一联网就打开浏览
ECHO 禁止一联网就打开浏览器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /d 1 /t REG_DWORD /f
echo 完成


:: 禁用任务计划程序自启项
ECHO 禁用任务计划程序自启项
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Routine Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineUA"
SCHTASKS /Change /DISABLE /TN "\GoogleUpdateTaskMachineCore"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
SCHTASKS /Change /DISABLE /TN "\AdobeAAMUpdater-1.0-%computername%-%username%"
SCHTASKS /Change /DISABLE /TN "\Microsoft\Office\Office 15 Subscription Heartbeat"
echo 完成


:: 去除快捷方式小箭头和后缀
ECHO 去除快捷方式小箭头和后缀
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 完成


:: 去除UAC小盾牌
ECHO 去除UAC小盾牌
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
echo 完成


:: Win10去掉桌面箭头
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
pause


:: Win10恢复桌面箭头
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
pause


