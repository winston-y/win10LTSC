# 桌面运维自动化
本项目是我在桌面运维工作中用到的自动化脚本。



## Downloading Git

```cmd
curl -O https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.2/Git-2.29.2.2-64-bit.exe
```


## file url





# [Installing Chocolatey](https://chocolatey.org/docs/installation#more-install-options)



#####  Install with cmd.exe

```cmd

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


```

```cmd
netsh winhttp set proxy 192.168.1.18:7890
netsh winhttp show proxy
```



#####  Install with PowerShell.exe

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```







|                   |                                                              |
| ----------------- | ------------------------------------------------------------ |
| **my_ninite.bat** | https://raw.githubusercontent.com/winston-y/win10init/main/my_ninite.bat |
| **gen_init.bat**  | https://raw.githubusercontent.com/winston-y/win10init/main/gen_init.bat |

## 
## 推荐的win10版本以及其他工具
- NTLite
- Windows 10 Enterprise LTSC 2019 (x64) - DVD (Chinese-Simplified) 


|              |                                                         |
| ------------ | ------------------------------------------------------- |
| **文件名**   | cn_windows_10_enterprise_ltsc_2019_x64_dvd_9c09ff24.iso |
| **SHA1**     | 24b59706d5eded392423936c82ba5a83596b50cc                |
| **文件大小** | 4.17GB                                                  |
| **发布时间** | 2019-03-15                                              |
|              |                                                         |



```ed2k
ed2k://|file|cn_windows_10_enterprise_ltsc_2019_x64_dvd_9c09ff24.iso|4478906368|E7C526499308841A4A6D116C857DB669|
```


