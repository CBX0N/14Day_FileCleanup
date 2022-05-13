set-location C:\vScreen

$date = (get-date).AddDays(-14)

$files = Get-childitem | where{$_.name -like "REL-*"}
$files = Get-childitem -recurse $files | `
         where {($_.LastWriteTime -lt $date) -and `
                ($_.Extension -eq ".exe") -and `
                ($_.Name -like "RC_*") }

$files = $files.VersionInfo.Filename 

foreach ($file in $files){
    write-host "Purging : " $file
    remove-item -path $file
}

write-host "----- DONE -----"

set-location C:\GitHub\14Day_FileCleanup 