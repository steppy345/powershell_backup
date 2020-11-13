################################################
#
#  Create backup to external drive
#
#
#  Author: Michael Stepniewski
#  Contact: infotechpro.stepniewski@gmail.com
#
#################################################
Write-Output "Backup to external storage starting...`n"

robocopy G:\ E:\ /MIR /MT /V /ZB

Write-Output "Backup to external storage Complete`n" + $(Get-Date -Format MM-dd-yyyy-HH-mm-ss)