<# 
probably should have known
try/catch works in PS
ForEach also works
can put params anywhere

edit > snippets

use a script: Scheduled Job
use a Function: 
advanced function: ps files that act like binary cmdlets. 
cmdlet: binary complied program written in .net

When seeing output, that's not necessarily everything that is available.
Anything in .Net can be called in powershell natively
***************************************

Stuff to look up: 
parameter sets
Write-Progress
inner polarization
Process block parameters:
ValueFromPipeline
ValidateSet
Alias


Begin: happens once
Proces: do this for everything
End: end

When creating objects, use: psCustomObject
*****************************
commands:
nltest
Get-Process/Stop-Process -erroraction 

Get-ADComputer -LDAPFilter "(cn=)"

if(Machine "Number of logged in Users" -eq 0 or $killallmachines)
{
}

parameter(Mandatory $true,
          valuefrompipelineByPropertyName $true,
          ValueFromPipeline $true)
*******************************

Pipelining:


#>

$var1 = ls
$var1.psobject


