###########################################
##### VARIABLE CREATION/COLLECT INPUT #####
###########################################
$LinePre = "tel:"

#Prompt for employee email and store it as the $Identity variable
$Identity = Read-Host -Prompt 'Please enter the email address of the employee'

#Prompt for phone number and store it as the $LineURI variable
$LineURI = Read-Host -Prompt 'Please enter the phone number you want to assign to this employee in E164 format(ie 1XXXYYYZZZZ)'


###########################
##### RUN THE COMMAND #####
###########################
#Assign the phone number to the account
Set-CsUser -Id $Identity -EnterpriseVoiceEnabled $true -HostedVoiceMail $true -LineURI $LinePre+$lineuri

#Assign voice routing policy to user
Grant-CsTeamsUpgradePolicy -Identity $Identity -PolicyName UpgradeToTeams
Grant-CsOnlineVoiceRoutingPolicy -PolicyName 'all-traffic-to-sbc' -Identity $Identity


##########################
##### VERIFY SUCCESS #####
##########################
Get-CsOnlineUser -Identity $Identity | select DisplayName, *voice*, LineURI, privateline
