function Get-DiskSpace(){
    <#
    .SYNOPSIS
    Returns the total amount of disk space, amout free, and percent free (in bytes).

    .DESCRIPTION
    This function returns the total amount of disk space available in bytes, and optionally the
    amount free, or the percent free for a server or list of servers. Can also optionally pass in 
    credentials for authenticating to remote servers.

    .PARAMETER ServerName
    A single computer name or an array of computer names. May also provide IP addresses

    .PARAMETER PSCredential
    Username and password stored as acredential for authenticating to remote servers (only applies to remote servers)

    .EXAMPLE
    View percent of disk space free on local server.
    Get-Diskspace -Percent

    .EXAMPLE
    Read server names from a file and retrieve disk space data
    Get-Content C:
    serverlist.txt | Get-Diskspace

    .NOTES
    @author Jeremy Giles

    #>
    [CmdletBinding()] param(
        [Parameter(ValueFromPipeline=$True)][String]$ServerName,
        $PSCredential,
        [switch]$Free,
        [switch]$Total,
        [switch]$Percent
    
    )
    $array = @()
    $parms = @{class='Win32LogicalDisk'; filter='DriveType=3'}
    
    if ($PSCredential) {$parms.Add('Credential', $PSCredential)} # Add Parameter if set, otherwise run locally.

    $ServerName | % {
        if ($_) {$parms.Set_Item('ComputerName',$_)} # add ServerName if set, otherwise run locally.
        $array += Get-WMIObject @parms
    }
    Switch($PSBoundParameters.Keys) {
    'Free' {Return $array | % {$_.FreeSpace}} # Return Free Space if switch specified
    'Total' {Return $array | % {$_.Size}} # Return Total Size if switch specified
    'Percent' {Return $array | % {$_.FreeSpace / $_.Size}} # Return Percentage if switch specified
    }

    return $array
}