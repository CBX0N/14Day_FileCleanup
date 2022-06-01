set-location C:\vScreen

$date = (get-date).AddDays(-14)

$files = Get-childitem | where{$_.name -like "REL-*"}
$files = Get-childitem -recurse $files | `
         where {($_.LastWriteTime -lt $date) -and `
                ($_.Extension -eq ".exe") -and `
                ($_.Name -like "RC_*") }

$files = $files.VersionInfo.Filename 

write-host "--------- Cleaning up Old Files ---------"

foreach ($file in $files){
    write-host "Purging : " $file
    remove-item -path $file
}

write-host "----------------- DONE ------------------"

Start-sleep -Seconds 1

write-host "----- Cleaning up Empty Directories -----"

$dirs = Get-ChildItem
$nonEmptyDirs = Get-ChildItem -Recurse | select Directory 
$nonEmptyDirs = $nonEmptyDirs.directory.name | Get-Unique
$emptyDirs = $dirs | Where-Object {$_.Name -notin $nonEmptyDirs}

foreach($emptyDir in $emptyDirs){

    write-host "Purging : " $emptyDir
    remove-item -path $emptyDir
}

"----------------- DONE ------------------"

set-location C:\GitHub\14Day_FileCleanup 