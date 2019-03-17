Get-ChildItem -recurse | Where {!$_.PSIsContainer -and `
$_.LastWriteTime -lt (get-date).AddDays(-31)} | Remove-Item -whatif

Get-ChildItem -recurse | Where {$_.PSIsContainer -and `
@(Get-ChildItem -Lit $_.Fullname -r | Where {!$_.PSIsContainer}).Length -eq 0} |
Remove-Item -recurse -whatif