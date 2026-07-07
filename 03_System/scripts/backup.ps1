# backup.ps1
$source = "D:\Knowledge\MSK-KNOWLEDGE"
$dest = "F:\Backup\MSK-KNOWLEDGE_$(Get-Date -Format 'yyyy-MM-dd')"
robocopy $source $dest /MIR /R:3 /W:10