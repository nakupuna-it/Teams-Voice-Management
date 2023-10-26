#################   Connect to Teams Powershell #########################

#################   Collect UPN and save as variable #########################
$Identity = Read-Host -Prompt 'Please enter the email address of the employee'


#################   Disable/Un-Assign Online Phone System For That User   #########################
set-csuser -Identity $Identity -LineURI $null


#################   Confirm it worked correctly#########################
Get-CsOnlineUser -Identity $Identity  | select DisplayName, *voice*, LineURI

##### Removed "OnPrem" from -OnPremLineURI #####




