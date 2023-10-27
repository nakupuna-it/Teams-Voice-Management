###########################################
##### VARIABLE CREATION/COLLECT INPUT #####
###########################################
#Prompt for employee email and store it as the $Identity variable
$Identity = Read-Host -Prompt 'Please enter the email address of the employee'


###########################
##### RUN THE COMMAND #####
###########################
Get-CsOnlineUser -Identity $Identity | select DisplayName, *voice*, LineURI, privateline
