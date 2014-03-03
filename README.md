PowerSHell FTP
========================

Upload jpg images to a ftp server through PowerShell.
Put pictures to send in "medias" folder, they will be save in "save" folder after being treated.

HOW DOES IT WORK?
=================
The script checks the directory every second and, for security reasons, check if each picture creation date is greater than 2 seconds.
This is to avoid manipulating a picture that hasn't fully finished being written on disk (High quality image).
When the file is ok, picture is sent through ftp and saved in "save" folder.

You can execute the powershell script through a batch file you can put anywhere you want.

First: you have to put the script without the batch in c:\fff folder. 