param(
    [String]
    $DNSServerIPAddress,
    [string]$Domain,
    [string]$Password


)
Write-Output "Joining the domain: $Domain"

$user = "$Domain\admin"
$pass = ConvertTo-SecureString "$Password" -AsPlainText -Force
$DomainCred = New-Object System.Management.Automation.PSCredential $user, $pass
Add-Computer -DomainName "$Domain" -credential $DomainCred -PassThru

Write-Output "Done!!!"