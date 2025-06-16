# Deploy Resources Using Azure Cloud Shell

If you cannot use the Azure CLI locally--such as when your machine does not have it installed or your device does not support it--you can use the [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview), a browser-based shell provided by Microsoft.

Before proceeding, review this article: [Deploy ARM templates from Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cloud-shell?tabs=azure-cli).

To deploy the template, run these commands in Azure Cloud Shell:

```shell
az group create --name rg-mssentinel-lab-1 --location "West US"
az deployment group create --name Deploy-001 --resource-group rg-mssentinel-lab-1 --template-uri "https://raw.githubusercontent.com/jcoliz/MsSentinel.HandsOnLab.1/refs/heads/main/infra/resources.json"
```
