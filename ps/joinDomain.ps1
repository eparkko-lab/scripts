param(    
    [string]$Domain,
    [string]$Password,
    [string]$ComputerName
)

if (($Domain -eq "") -or ($Domain -eq $null ))
{
    Write-Output "Need to set -Domain parameter"
    exit 1
}
if (($Password -eq "") -or ($Password -eq $null ))
{
    Write-Output "Need to set -Password parameter"
    exit 1
}
if (($ComputerName -eq "") -or ($ComputerName -eq $null ))
{
    Write-Output "Need to set -ComputerName parameter"
    exit 1
}

Write-Output "Renaming Computer to: $ComputerName"
Rename-Computer -NewName $ComputerName

Write-Output "Joining the domain: $Domain"
$user = "$Domain\admin"
$pass = ConvertTo-SecureString "$Password" -AsPlainText -Force
$DomainCred = New-Object System.Management.Automation.PSCredential $user, $pass
Add-Computer -DomainName "$Domain" -credential $DomainCred -PassThru

Write-Output "Done!!!"