#################   Connect to Teams Powershell #########################


#################   Collect UPN and Phone Number  and save as variables #########################
$Identity = Read-Host -Prompt 'Please enter the email address of the employee'
$LinePre = "tel:"
$LineURI = Read-Host -prompt 'Please enter the phone number you want to assign to this employee in E164 format(ie 1XXXYYYZZZZ)'



#################   Enable/Assign Online Phone System For That User   #########################
Set-CsUser -Id $Identity -EnterpriseVoiceEnabled $true -HostedVoiceMail $true -LineURI $LinePre+$lineuri
#Assign voice routing policy to user
Grant-CsTeamsUpgradePolicy -Identity $Identity -PolicyName UpgradeToTeams
Grant-CsOnlineVoiceRoutingPolicy -PolicyName 'all-traffic-to-sbc' -Identity $Identity


#################   Confirm it worked correctly#########################
Get-CsOnlineUser -Identity $Identity | select DisplayName, *voice*, LineURI, privateline




<######################### CHANGELOG #########################
Removed "OnPrem" from -OnPremLineURI
"Set-CsUser -Identity" changed to "Set-CsUser -Id"
Added "privateline" to the end of the Get-CsOnlineUser command
#############################################################>
