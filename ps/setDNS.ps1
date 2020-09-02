param(
    [String]
    $DNSServerIPAddress,
    [string]$AdapterName

)

$IntIndexString=Get-NetAdapter -Name $AdapterName | Format-List -Property InterfaceIndex | Out-String
$IntIndex=$IntIndexString.split(':')[1]

Write-Output $IntIndex

Set-DnsClientServerAddress -InterfaceIndex $IntIndex -ServerAddresses ("$DNSServerIPAddress")