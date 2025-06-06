# Tech Check Guide

Follow this guide to ensure you have everything set up ready to start the Hands-on-Lab.

## Azure account

You'll need an Azure account, with the ability to create Resource Groups. Set up a [Free Azure Account](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account) to get started.

One you have it set up, take a moment to confirm some details about your account

1. Log into the [Azure Portal](portal.azure.com) as a user with Contributor role on the subscription where you intend to deploy.
2. Click the user icon in upper-right corner, and pick "Switch Directory"
3. Ensure the correct directory is current, or click "Switch" to switch into the desired directory. Make note of the "Directory ID" shown. This is also known as the "Tenant ID". Then close this pane, with the "X" button in upper-right corner.
4. Back at the home page of the portal, pick "Subscriptions"
5. Choose of the subscription you'll want to use. Make note of the "Subscription ID" of this subscription. 
6. Later we will use these values to confirm that we are deploying into the correct subscription in the correct tenant.

## Azure CLI tool with Bicep

Do you already have this installed? Run the following commands in a terminal window. Ensure both complete without error.

```pwsh
az --version
az bicep version
```

If either of these fail, you'll need to install [Azure CLI with Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-cli). After installing, close and re-open your terminal window, and try again the commands above.

## Git client

To check whether you have a git client installed, run the following command in a terminal window:

```pwsh
git --version
```

If this fails, you can install a git client for your OS. For Windows, use [Git for Windows](https://gitforwindows.org/). After installing, close and re-open your terminal window, and try again the commands above.

## Execution policy

This lab includes an unsigned PowerShell script, requiring `Unrestricted` execution policy. First, check your current execution policy, using the following command in a terminal window:

```pwsh
Get-ExecutionPolicy -Scope CurrentUser
```

If this comes back with anything but `Unrestricted`, you can set it as follows:

```pwsh
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```

## Visual Studio Code

This one is easy! Open Visual Studio code locally, and install any updates when prompted. If you don't have it, visit the [VS Code Downloads](https://code.visualstudio.com/Download) page to grab the latest for your OS architecture. For Windows users, I recommend the System Installer.

## Onward!

Congratulations! You've met all the prerequisities, and now you're ready to set up the lab. Continue here: [Lab Setup](../README.md#setup)
