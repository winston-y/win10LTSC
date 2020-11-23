@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo start https://github.com/winston-y/win10init > %USERPROFILE%\Desktop\temp.bat
mkdir C:\TECH && cd C:\TECH && start .
setx /m PATH "%PATH%;C:\TECH"

echo start https://github.com/winston-y/win10init >> gowin10init.bat

gowin10init.bat

