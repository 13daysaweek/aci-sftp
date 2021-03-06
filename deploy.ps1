$resourceGroup = $args[0]

if ($resourceGroup) {
    $deploymentName = "$resourceGroup-$(Get-Date -Format "MM-dd-yyyy_HH-mm-ss")"
    Write-Host -ForegroundColor Green "Running deployment $deploymentName in Resource Group $resourceGroup"    
    az deployment group create -g $resourceGroup -n $deploymentName --template-file .\original-template.json --parameters .\original-parameters.json
} else {
    Write-Host -ForegroundColor Red "Please specify resource group when running this script"
    Write-Host -ForegroundColor Red "Usage: .\deploy.ps1 [resource-group-name]"
}
