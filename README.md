# AD-Comp-Mover Powershell script #
## Motivation ##
Powershell script to move a computer object into an OU based on machine name.  To be run as part of an MDT task sequence.

## Example ##
Room (OU) Naming
AB123

Computer Name
AB123-01
AB123-12

Gets the machine name of the computer, where the script is being run e.g. AB123-01.

Trims hyphen and succeeding charters to identify the destination room name.

Checks AD for instance for the room name OU.

If there is a unique match the machine is moved into the OU.
