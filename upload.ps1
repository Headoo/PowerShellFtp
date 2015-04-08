#
# Edouard Kombo <edouard.kombo@gmail.com>
# 2014/02/19
# Powershell script
# Download multiples files through ftp with Powershell
#

#Directory where to find pictures to upload
$Dir= 'c:\PowerShellFtp\medias\'

#Directory where to save uploaded pictures
$saveDir = 'c:\PowerShellFtp\save\'

#ftp server params
$ftp = 'ftp://10.0.1.11:26000/'
$user = 'snitch'
$pass = 'headoo'

#Connect to ftp webclient
$webclient = New-Object System.Net.WebClient 
$webclient.Credentials = New-Object System.Net.NetworkCredential($user,$pass)  

#Initialize var for infinite loop
$i=0

#Infinite loop
while($i -eq 0){ 

    #Pause 1 seconde before continue
    Start-Sleep -sec 1

    #Search for pictures in directory
    foreach($item in (dir $Dir "*.jpg"))
    {
        #Set default network status to 1
        $onNetwork = "1"

        #Get picture creation dateTime...
        $pictureDateTime = (Get-ChildItem $item.fullName).CreationTime

        #Convert dateTime to timeStamp
        $pictureTimeStamp = (Get-Date $pictureDateTime).ToFileTime()

        #Get actual timeStamp
        $timeStamp = (Get-Date).ToFileTime() 
        
        #Get picture lifeTime
        $pictureLifeTime = $timeStamp - $pictureTimeStamp

        #We only treat pictures that are fully written on the disk
        #So, we put a 2 second delay to ensure even big pictures have been fully wirtten in the disk
        if($pictureLifeTime -gt "2") {    

            #If upload fails, we set network status at 0
            try{

                $uri = New-Object System.Uri($ftp+$item.Name)

                $webclient.UploadFile($uri, $item.FullName)

            } catch [Exception] {
                
                $onNetwork = "0"
                write-host $_.Exception.Message;
            }

            #If upload succeeded, we do further actions
            if($onNetwork -eq "1"){
                "Copying $item..."
                Copy-Item -path $item.fullName -destination $saveDir$item 

                "Deleting $item..."
                Remove-Item $item.fullName
            }


        }  
    }
}	