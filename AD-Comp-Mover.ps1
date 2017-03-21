Import-Module activedirectory

#Get this machine name
$sourceMachine = $env:computername

#Get the room from before the hyphen in machine name.
$room = $env:computername.split('-')[0]

#Search AD for room OU, if it exist, identify DN.
$DestDN = (Get-ADOrganizationalUnit -Filter 'Name -like $room')

#Check home many instance of this OU exist
switch (@($DestDN).Count)
{
	0 {
	#No OU match no move performed.
	Write-Host "No OU matches, no move performed."
	break;
	}
	
	#One match move the machine into it.
	1 {
	get-adcomputer $sourceMachine | Move-ADObject -TargetPath $DestDN
	Write-Host $sourceMachine " moved in to " $DestDN
	break;
	}
	
	#More than one match move machine into first match
	default  {
	
	Write-Host $DestDN.count "OU matches, no move performed." 
	break;
	}

}
