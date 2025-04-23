# Microsoft Sentinel Hands On Lab #1

When this lab is complete, participants will set up a Microsoft Sentinel workspace, and connect a Codeless Connector Platform-based connector to a live API endpoint. With that in place, they'll explore common components deployed in a Microsoft Sentinel solution, including: Workbooks, parsers, and analytics rules.

## Prerequisites

To participate in this lab, you will first need:

* An Azure Account. Set up a [Free Azure Account](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account) to get started.
* [Azure CLI tool with Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-cli)
* A git client, e.g. [Git for Windows](https://gitforwindows.org/)
* Execution policy configured to run PowerShell scripts, see [About Execution Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies)
* A code editor, e.g. [Visual Studio Code](https://code.visualstudio.com/)

## Setup

Please complete these steps before beginning the lab.

### 1. Clone this repo

Clone this repo with submodules so you have the [AzDeploy.Bicep](https://github.com/jcoliz/AzDeploy.Bicep) project handy with the necessary module templates.

```powershell
git clone --recurse-submodules https://github.com/jcoliz/MsSentinel.HandsOnLab.1.git
```

### 2. Log into Azure

In a terminal window, ensure you are logged into Azure

```dotnetcli
az login
```

Then verify that the subscription you're logged into is where you want to deploy. Make adjustments as needed.

```dotnetcli
az account show
```

## Deploy resources

In this lab, you will create a resource group and deploy the following resources to your Azure subscription:

* Sentinel-enabled Log Analytics Workspace
* Azure Container App running a synthetic API endpoint

To deploy these, run the [Deploy-Services.ps1](./.azure/deploy/Deploy-Services.ps1) script. Supply a resource group name and
Azure datacenter location according to your preference.

```dotnetcli
.\Deploy-Services.ps1 -ResourceGroup mssentinel-lab-1 -Location westus
```

When this script completes, it will pass along some helpful information:

```dotnetcli
Deployed sentinel workspace sentinel-redacted
Synthetic endpoints available at https://c-web-redacted.westus.azurecontainerapps.io/

When finished, run:
az group delete --name mssentinel-lab-1
```

## Next Steps

These will be further documented as work on the lab progresses

* Explore the API endpoint
* Enable Sentinel Health monitoring
* Install a solution from Content Hub
* Connect a connector
* Check deployment logs
* Check app logs to verify connection check arrived, and notice when the connector is running
* Check DCR rule metrics
* Check connector page for liveness queries
* Check data in logs

## Tour of included Sentinel components

### Workbook

### Parser

### Analytics rule

* View workbook
* View parser in solution

* Edit workbook (First: Save, then jump to "My workbooks" and "view saved workbook", set to "last hour")
    Edit workbook, then Edit Agents by version, 

Set KQL to following:

```kusto
SentinelOne
| where Type == "SentinelOneAgents_CL"
| summarize count() by AgentVersion
```

* Edit function in logs, remove "Sentinel_CL"

* Change analytics rule
* View health table

## Tear down

When you're done, simply tear down the entire resource group:

```dotnetcli
az group delete --name mssentinel-lab-1
```
