param(
    [Parameter(Mandatory=$true)]
    [string]
    $ResourceGroup
)

Write-Output "Deploying environment $EnvironmentName"
$result = az deployment group create --name "Deploy-$(Get-Random)" --resource-group $ResourceGroup --template-file ./infra/resources.bicep | ConvertFrom-Json

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
