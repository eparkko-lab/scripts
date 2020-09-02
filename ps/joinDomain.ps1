param(    
    [string]$Domain,
    [string]$Password
    [string]$ComputerName


)

Write-Output "Renaming Computer to: $ComputerName"
Rename-Computer -NewName $ComputerName

Write-Output "Joining the domain: $Domain"
$user = "$Domain\admin"
$pass = ConvertTo-SecureString "$Password" -AsPlainText -Force
$DomainCred = New-Object System.Management.Automation.PSCredential $user, $pass
Add-Computer -DomainName "$Domain" -credential $DomainCred -PassThru

Write-Output "Done!!!"