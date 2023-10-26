###########################################
##### VARIABLE CREATION/COLLECT INPUT #####
###########################################
$LinePre = "tel:"
$Result = $null

#Prompt for phone number and store it as the $LineURI variable
$LineURI = Read-Host -prompt 'Please enter the phone number you want to look up in E164 format(ie 1XXXYYYZZZZ)'

#Lookup the number and store the result as the $Result variable
$Result = Get-CsOnlineUser -Filter "LineURI -eq `"$LinePre$LineURI`""


###############################
##### OUTPUT/RESULT LOGIC #####
###############################
IF ($Result -ne $null)
{
    #If the number is assigned, output the information
    $Result | select DisplayName, UserPrincipalName, *voice*, LineURI
}

ELSE
{
    #If it's not assigned, state this is the case
    Write-Host "No current assignments found for the phone number"$LineURI
}