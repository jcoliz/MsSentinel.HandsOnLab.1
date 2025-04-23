param(
    [Parameter(Mandatory=$true)]
    [string]
    $ResourceGroup,
    [Parameter(Mandatory=$true)]
    [string]
    $Location
)

Write-Output "Creating Resource Group $ResourceGroup in $Location"
az group create --name $ResourceGroup --location $Location

Write-Output "Deploying to Resource Group $ResourceGroup"
$result = az deployment group create --name "Deploy-$(Get-Random)" --resource-group $ResourceGroup --template-file ./azuredeploy.bicep | ConvertFrom-Json

Write-Output "OK"
Write-Output ""

$sentinelWorkspaceName = $result.properties.outputs.sentinelWorkspaceName.value
$appFqdn = $result.properties.outputs.appFqdn.value

Write-Output "Deployed sentinel workspace $sentinelWorkspaceName"
Write-Output "Synthetic endpoints available at https://$appFqdn/"
Write-Output ""

Write-Output "When finished, run:"
Write-Output "az group delete --name $ResourceGroup"
