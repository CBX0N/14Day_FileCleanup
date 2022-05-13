set-location C:\vScreen

$copydirs = 'REL-##','REL-###','REL-####','REL-#####',`
            'STG-#','STG-##','STG-###','STG-####','STG-#####'

New-Item -ItemType Directory -name 'REL-#' -erroraction silentlycontinue
New-Item -Path REL-#\ -ItemType file -name 'RC_1.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'RC_5.exe' -erroraction silentlycontinue

New-Item -Path REL-#\ -ItemType file -name 'RG_1.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'RG_5.exe' -erroraction silentlycontinue  

(Get-Item "REL-#\RC_1.exe").LastWriteTime = '04/01/2022 06:00:36'
(Get-Item "REL-#\RC_5.exe").LastWriteTime = '05/13/2022 06:00:36'
(Get-Item "REL-#\RG_1.exe").LastWriteTime = '04/01/2022 06:00:36'
(Get-Item "REL-#\RG_5.exe").LastWriteTime = '05/13/2022 06:00:36'

foreach ($dir in $copydirs) {
    New-Item -ItemType Directory -name $dir -erroraction silentlycontinue
    copy-item -path 'REL-#\*' -Destination $dir'\' -recurse
}

set-location C:\GitHub\14Day_FileCleanup