param(
    [Parameter(Mandatory=$true)]
    [string]
    $EnvironmentName,
    [Parameter(Mandatory=$true)]
    [string]
    $Location
)

Write-Output "Deploying environment $EnvironmentName"
$result = az deployment sub create --name "Deploy-$(Get-Random)" --template-file ./main.bicep --location $Location --parameters environmentName="$EnvironmentName" | ConvertFrom-Json

Write-Output "OK"
Write-Output ""

$sentinelWorkspaceName = $result.properties.outputs.sentinelWorkspaceName.value
$appFqdn = $result.properties.outputs.appFqdn.value
$rgName = $result.properties.outputs.rgName.value

Write-Output "Deployed sentinel workspace $sentinelWorkspaceName"
Write-Output "Synthetic endpoints available at https://$appFqdn/"
Write-Output ""

Write-Output "When finished, run:"
Write-Output "az group delete --name $rgName"
