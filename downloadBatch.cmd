::PUT ME ON THE DESKTOP
goto downloadAll

:downloadAll
Powershell C:\PowerShellFtp\download.ps1
timeout  60
goto downloadAll
