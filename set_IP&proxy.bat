@echo off
echo       ===========================================
echo             ???????????????
echo       ===========================================
echo.
echo             S.??ip???ip??????
echo.
echo             R.??ip???ip??????
echo.
echo             Q.??
echo.
echo.
echo.

:loop_start
set /p choice=    ????
IF NOT "%choice%"=="" SET choice=%choice:~0,1%
if /i "%choice%"=="S" goto set_start
if /i "%choice%"=="R" goto reset_start
if /i "%choice%"=="Q" goto closee
echo ??????????
echo.
goto loop_start

::====================================================================================

:set_start
echo  ??IP??....
netsh interface ip set addr "???" static 192.168.4.83 255.255.255.0 192.168.4.1 1
echo  ??DNS??....
netsh interface ip set dns "???" static 192.168.10.10 primary validate=no
echo *****???????IP??????ip
echo.

echo ?????????……
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "192.168.13.19:7777" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "*.ffcs.cn;192.168.*;127.0.0.1;<local>" /f
echo.
echo *****??????????????
echo.
goto endd

::====================================================================================

:reset_start
echo  ??IP??....
netsh interface ip set addr "???" dhcp
echo  ??DNS??....
netsh interface IP set dns "???" dhcp
echo *****???????IP??????ip
echo.

echo ???????????……
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "" /f
echo.
echo *****????????????????
echo.
goto endd

::====================================================================================

:endd
pause
:closee
