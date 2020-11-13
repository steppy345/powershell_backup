################################################
#
#  Create a System Image Backup
#  Backup to internal backup SSD
#
#  Author: Michael Stepniewski
#  Contact: infotechpro.stepniewski@gmail.com
#
#################################################

$backup_source = 'C:,D:'
$backup_destination = 'G:'
$logfile = 'C:\Log\BackupLog-' + $(Get-Date -Format MM-dd-yyyy-HH-mm-ss) + '.txt'

#Create New Backup Log File
New-Item -Path $logfile -ItemType File

#Backup starting on logfile
Write-Output "Backup Starting `n`n" | Out-File $logfile -Append

#Begin Backup
wbAdmin start backup -backupTarget:$backup_destination -include:$backup_source -allCritical | Out-File $logfile -Append

Write-Output "Backup Success" | Out-File $logfile -Append

Write-Output "Spawning External Backup Process" | Out-File $logfile -Append
& "$PSScriptRoot\copy_backup_ext.ps1"
