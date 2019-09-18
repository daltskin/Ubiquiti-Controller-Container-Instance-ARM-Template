Clear-Host
$RGName = "RG-UnifiController";
$DeployLocation = "West Europe";

# 1. Login
az login

# 2. Create Resource Group
$sw = [system.diagnostics.stopwatch]::startNew()
az group create --name $RGName --location $DeployLocation

#3. Create a deployment using the ARM template
az group deployment create `
  --name TestDeployment `
  --resource-group $RGName `
  --template-file AzureDeploy.json

  $sw | Format-List -Property *
