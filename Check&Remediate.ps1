#### CHECK ####

$entry = "Services  1234/tcp"
$file = Get-Content -Path "$env:windir\system32\drivers\etc\services"
if ($file -match $entry) {
    Write-Host "True"
} else {
    Write-Host "False"
}

##### REMEDIATE ####

$serviceName = "Service"
$portNumber = "1234"

$servicesFile = "$env:SystemRoot\System32\drivers\etc\services"
$lineToInsert = "$serviceName  $portNumber/tcp"

Add-Content -Path $servicesFile -Value $lineToInsert
Add-Content -Path $servicesFile -Value ""

Write-Host "Service added to services file."