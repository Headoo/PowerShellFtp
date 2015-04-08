POWERSHELL FTP
==============
Upload multiple files to ftp with Powershell in background.
Download multiple files from ftp with Powershell in background.

HOW DOES IT WORK?
=================

1. UPLOAD SIDE
The script checks every second, for "jpg" images in a "medias" directory on your hard drive.
When an image is found, it is automatically sent to the remote ftp directory you specify.

2. DOWNLOAD SIDE
The script checks every minute, inside the ftp directory, and download new files.

Security options
================

1. UPLOAD SIDE
If upload is complete, the image is saved in a "save" directory on your hard drive, then, deleted from the "medias" directory.
If upload is not complete, images still in "medias" directory and the script tries again indefinitely.
For big size images, we wait 2 seconds after an image has been created in the "medias" folder, to send it through ftp.

1. DOWLOAD SIDE
Downloads only files that doesn't exist inside the directory.

Instructions
============
- Download the git repository, by default in your "C" hard drive directory:
    git clone https://github.com/headoo/PowerShellFtp
	
	OR, manually create a "C:\PowerShellFtp" directory and download manually, the folder content inside this directory.

- If your purpose is to download files:
    Right click on the "C:\PowerShellFtp\Assembly\ChilkatDotNet45.dll" file.
	Click on properties.
	Click on unlock	.
	
- Open the "upload.ps1" or "download.ps1" depending on your needs, and fill in the right FTP credentials.	
	
- Move the corresponding batch files ("downloadBatch" or "uploadBatch") on the desktop

- Click on the batch you need, and let them run


PS: 
- if you upload files, put the files inside the "medias" directory.
- If you download files, files will be stored inside the "save" directory.
	