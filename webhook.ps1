
#Change this to your Discord URL
   $webhookUri = 'Your Discord Webhook URL' 
   
   $PlayerIDName = @{}
   #Change this to the log file name and location that you set your Valheim server to generate to. 
   $InitialLength = (Get-Content C:\Valheim\logs\log.txt).Length
   $counter = 1
   $ErrorActionPreference = "SilentlyContinue"

#Change this to the log file name and location that you set your Valheim server to generate to. 
Get-Content C:\Valheim\logs\log.txt -wait | ForEach-Object { 

$counter++

If ($_ -match 'Got Character ZDOID') { 
    
$parse = $_.Split(" ")
        $PlayerName = $parse[6]
        $PlayerID =  $parse[8]


   $currentline = $_
$currentline = $currentline.substring($currentline.length - 5, 5)

        if ($counter -gt $InitialLength)
        {

        if ($PlayerIDName.Keys -notcontains $PlayerName)
             {
                      Write-Host $Playername " has logged in." -ForegroundColor Green
        $value = $PlayerIDName.Count
        if ($value -eq 0) 
        {
        $value = 1
        }

                        $Body = @{
                          'username' = 'Valheim_Janet'
                          'content' = $PlayerName + ' has logged in! :beers: 
Current active players: ' + $value
                          'avatar_url' = 'https://live.staticflickr.com/2501/3867432663_768765c8aa_b.jpg'
                        }
                        Invoke-RestMethod -Uri $webhookUri -Method 'post' -Body $Body
             }

        }

           $PlayerIDName.Add($PlayerName, $PlayerID)
}


if ($currentline -like ": 0:0") {
      if ($counter -gt $InitialLength)
               {

               Write-Host $PlayerName " has DIED X_X" -ForegroundColor red
               $currentline =""

                        $Body = @{
                          'username' = 'Valheim_Janet'
                          'content' = $PlayerName + ' has DIED :skull_crossbones: RIP.'
                          'avatar_url' = 'https://live.staticflickr.com/2501/3867432663_768765c8aa_b.jpg'
                        }
                        Invoke-RestMethod -Uri $webhookUri -Method 'post' -Body $Body


               }
}

if ($_ -match 'Destroying abandoned non persistent zdo'){
$parse = $_.Split(" ")
 

$PlayerIDName.Keys | ForEach-Object {

  $PlayerIDLeft = $parse[9]

         if ( $($PlayerIDName[$_]) -notmatch $PlayerIDLeft)
         {

         }

         elseif ($($PlayerIDName[$_]) -match $PlayerIDLeft)
         {
           #remove playerIDName entry
          $PlayerIDName.Remove($_)
                if ($counter -gt $InitialLength)
                 {
                 Write-Host $_ " has logged out." -ForegroundColor Green
               
                        $Body = @{
                          'username' = 'Valheim_Janet'
                          'content' = $_ + ' has logged out! :wave: 
Current active players: ' + $PlayerIDName.Count
                          'avatar_url' = 'https://live.staticflickr.com/2501/3867432663_768765c8aa_b.jpg'
                        }
                        Invoke-RestMethod -Uri $webhookUri -Method 'post' -Body $Body
          
                

                 }

         }
  
  }


}



 }
 
