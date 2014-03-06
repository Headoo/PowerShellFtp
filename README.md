POWERSHELL FTP
==============
Upload jpg images on the hard drive to a ftp server, using PowerShell.

HOW DOES IT WORK?
=================
The script checks every second, for "jpg" images in a "medias" directory on your hard drive.
When an image is found, it is automatically sent to the remote ftp directory you specify.

Security options
================
If upload is complete, the image is saved in a "save" directory on your hard drive, then, deleted from the "medias" directory.
If upload is not complete, images still in "medias" directory and the script tries again indefinitely.
For big size images, we wait 2 seconds after an image has been created in the "medias" folder, to send it through ftp.

Architecture
============
Put the script in a directory that you call, by example "c:\fff".
Create in this directory, two directories, "medias" and "save".

Automation
==========
To execute easier the file, put the automate batch on your desktop, run it.


NB: If you encounter any issues, feel free to contact me at edouard.kombo@gmail.com.