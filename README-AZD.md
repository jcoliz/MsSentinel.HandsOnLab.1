# Alternate instructions

These alternate setup instructions use the Azure Developer CLI extension in VS Code, experimenting to see if we can simplify these steps.

However, I have found that azd isn't super reliable and stable, so I'm choosing to stay with the tried-and-true Azure CLI.

## Pre-requisites

* An Azure Account. Set up a [Free Azure Account](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account) to get started.
* [Visual Studio Code](https://code.visualstudio.com/Download). Recommend the System Installer over User Installer for Windows users.

## Install Azure Developer CLI extension in VS Code

1. Launch VS Code
1. Choose "Extensions" from left toolbar
1. Enter "azd"
1. Pick "Azure Developer CLI"
1. Click "Install"
1. When prompted, install the Azure Developer CLI
1. Next, click "Sign into your Azure Account", and sign into the subscription where you will deploy
1. Cllose and re-open VS Code

## Install Azure Resources extension in VS Code

1. Launch VS Code
1. Choose "Extensions" from left toolbar
1. Enter "Azure Resources"
1. Pick "Azure Resources" extension
1. Click "Install"

## Clone this repo

1. Launch VS Code
1. Close any existing folders if open (File | Close Folder)
1. Hit [F1], and then type "git clone"
1. Pick the option "Git clone (Recursive)". Be sure to get the "recursive" choice.
1. Enter "https://github.com/jcoliz/MsSentinel.HandsOnLab.1"
1. Choose a location to clone into, e.g. "C:\Source"
1. When prompted to "Open cloned repository?", select "OK"

## Provision Azure Resources

1. Find `azure.yaml` in the explorer. Right click on it. Pick "Azure Developer CLI > Provision Azure Resources (provision)".
1. Enter a memorable unique environment name, e.g. `mssentinel-lab-1`
1. If you see a login error, check the error message for advice. You may see a prompt to log in using `azd auth login --tenant <your_tenant_id>`. Open a new terminal window, and type this in. Then repeat previous step
1. Choose the correct subscription to deploy into
1. Choose a nearby location to deploy into

This will create a resource group and deploy the following resources to your Azure subscription:

* Sentinel-enabled Log Analytics Workspace
* Azure Container App serving a synthetic API endpoint

```
  (✓) Done: Resource group: rg-mssentinel-lab-1 (775ms)
  (✓) Done: Log Analytics workspace: sentinel-something (16.151s)
  (✓) Done: Log Analytics workspace: applogs-something (16.35s)
  (✓) Done: Container Apps Environment: cenv-something (49.482s)
  (✓) Done: Container App: c-web-something (18.177s)
```

Next, you'll want to locate the URL where your endpoints are served. This will be needed in future steps

1. Find the `.azure` folder in the explorer and expand it
1. Find and expand the `mssentinel-lab-1` folder under that
1. Click on the `.env`
1. Locate the `appFqdn=` line in this file. It will contain a URL of the form `c-web-something.azurecontainerapps.io`. Hang onto this, you'll need it later!

## Return to README.md

From here, you can continue in the main [README.md](./README.md) file, from the "Review Resources" section.

## Tear down

When you're done, delete the entire resource group. The resource name for deletion was
given as an output when you initially deployed the resources.

1. In VS Code, click the Azure icon on the left nav bar
1. In the "Resources" section, click the "Group By" icon, and pick "Group by Resource Group"
1. Right click, and choose "Delete resource group"
