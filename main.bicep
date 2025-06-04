//
// Deploys a complete set of needed resources for the sample at:
//    https://github.com/jcoliz/MsSentinel.HandsOnLab.1
//
// Includes:
//    * Sentinel-enabled Log Analytics Workspace
//    * Azure container app running a synthetic API endpoint
//

targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment that can be used as part of naming resource convention')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

@description('Unique suffix for all resources in this deployment')
@minLength(5)
param suffix string = uniqueString(subscription().id,environmentName)

// Deploy a resource group

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-${environmentName}'
  location: location
}

// Deploy Microsoft Sentinel Workspace

module workspace 'AzDeploy.Bicep/SecurityInsights/sentinel-complete.bicep' = {
  name: 'workspace'
  scope: rg
  params: {
    suffix: suffix
    location: location
  }
}

// Deploy container app

module apiapp 'AzDeploy.Bicep/App/containerAppCompleteWeb.bicep' = {
  name: 'apiapp'
  scope: rg
  params: {
    suffix: suffix
    location: location
    webImageName: 'jcoliz/mssentinel-synthetic:latest'
    ingressPort: 8080
  }
}

output sentinelWorkspaceName string = workspace.outputs.logAnalyticsName
output appFqdn string = apiapp.outputs.fqdn
