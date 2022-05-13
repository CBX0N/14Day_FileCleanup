set-location C:\vScreen

$copydirs = 'REL-##','REL-###','REL-####','REL-#####'

New-Item -ItemType Directory -name 'REL-#' -erroraction silentlycontinue
New-Item -Path REL-#\ -ItemType file -name 'rc-1.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'rc-2.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'rc-3.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'rc-4.exe' -erroraction silentlycontinue 
New-Item -Path REL-#\ -ItemType file -name 'rc-5.exe' -erroraction silentlycontinue 

(Get-Item "REL-#\rc-1.exe").LastWriteTime = '04/01/2022 06:00:36'
(Get-Item "REL-#\rc-2.exe").LastWriteTime = '04/30/2022 06:00:36'
(Get-Item "REL-#\rc-3.exe").LastWriteTime = '05/01/2022 06:00:36'
(Get-Item "REL-#\rc-4.exe").LastWriteTime = '05/07/2022 06:00:36'
(Get-Item "REL-#\rc-5.exe").LastWriteTime = '05/13/2022 06:00:36'

copy-item -path 'REL-#\*' -Destination 'REL-##\' -recurse
copy-item -path 'REL-#\*' -Destination 'REL-##\' -recurse


foreach ($dir in $copydirs) {
    New-Item -ItemType Directory -name $dir -erroraction silentlycontinue
    copy-item -path 'REL-#\*' -Destination $dir'\' -recurse
}


Get-childitem -recurse

set-location C:\GitHub\14Day_FileCleanup