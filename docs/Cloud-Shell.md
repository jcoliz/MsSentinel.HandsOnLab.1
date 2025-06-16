# Deploy Resources using Azure Cloud Shell

There are situations where you may be unable to use the Azure CLI locally, such as when you are on a machine without the Azure CLI installed or when you are using a device that does not support the Azure CLI. 
In these cases, you can use the [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview), which is a browser-based shell provided by Microsoft.

For background, please first review this article: [Deploy ARM templates from Azure Cloud Shell](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cloud-shell?tabs=azure-cli)

To deploy the template, use the following commands in the Azure Cloud Shell:

```shell
az group create --name rg-mssentinel-lab-1 --location "West  US"
az deployment group create --name Deploy-001 --resource-group rg-mssentinel-lab-1 --template-uri "https://raw.githubusercontent.com/jcoliz/MsSentinel.HandsOnLab.1/refs/heads/main/infra/resources.json"
```
