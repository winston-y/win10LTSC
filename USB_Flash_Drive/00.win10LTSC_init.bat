
cd %~dp0
mkdir D:\TECH & start D:\TECH

:: ?????????? ?gpedit.msc | ?????->????->??->LANMAN????
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t "REG_DWORD" /d "1" /f

xcopy /e/y/i/f .\initArchive\win10LTSC_64 D:\TECH


choco config set proxy http://192.168.1.18:7890

choco install -y 7zip vlc aimp opera notepadplusplus
