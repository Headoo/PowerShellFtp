#
# Edouard Kombo <edouard.kombo@gmail.com>
# 2014/02/19
# Powershell script
# Upload pictures through ftp, save them in a directory and delete them
#

#Directory where to find pictures to upload
$Dir= 'c:\fff\medias\'

#Directory where to save uploaded pictures
$saveDir = 'c:\fff\save\'

#ftp server params
$ftp = 'ftp://xx.x.x.xx:#port#/'
$user = 'user'
$pass = 'pass'

#Conntect to ftp webclient
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
        #Get image datetime creation...
        $timestampCreation = (Get-ChildItem $item.fullName).CreationTime
        #Convert datetime to timestamp
        $creationTime = (Get-Date $timestampCreation).ToFileTime()

        #Get actual timestamp
        $actualTimestamp = (Get-Date).ToFileTime() 
        
        #Get Time stamp diff
        $timestampDiff = $actualTimestamp - $creationTime
        
        #"Timestamp actual $actualTimestamp"
        "Timestamp creation $creationTime // $actualTimestamp"

        #If image was created at least 1one second ago, make treatments
        if($timestampDiff -gt "2") {    
     
            "Uploading $item..."
            $uri = New-Object System.Uri($ftp+$item.Name) 
            $webclient.UploadFile($uri, $item.FullName)
        
            "Copying $item..."
            Copy-Item -path $item.fullName -destination $saveDir$item 

            "Deleting $item..."
            Remove-Item $item.fullName
        }  
    }
}	