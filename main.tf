resource "azurerm_template_deployment" "service_app_certificate_main" {
  name                = "${format("%s-arm-certificate", lower(replace(var.certificate_name,"[[:space:]]","-")))}"
  resource_group_name = "${var.resource_group_name}"
  deployment_mode     = "Incremental"

  template_body = <<DEPLOY
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "certificateName": {
            "type": "string"
        },
        "keyvaultId" :{
            "type": "string"
        },
        "servicePlanId": {
            "type": "string"
        }
    },
    "resources": [
        {
            "type":"Microsoft.Web/certificates",
            "name":"[parameters('certificateName')]",
            "apiVersion":"2016-03-01",
            "location":"[resourceGroup().location]",
            "properties":{
                "keyVaultId":"[parameters('keyvaultId')]",
                "keyVaultSecretName":"[parameters('certificateName')]",
                "serverFarmId": "[parameters('servicePlanId')]"
            }
        }
    ],
    "outputs": {
        "thumbprint": {
            "type": "string",
            "value": "[reference(resourceId('Microsoft.Web/certificates', parameters('certificateName'))).Thumbprint]"
        }
    }
}
DEPLOY

  parameters {
    "servicePlanId"   = "${var.service_plan_id}"
    "certificateName" = "${var.certificate_name}"
    "keyvaultId"      = "${var.keyvault_id}"
  }

  depends_on = []
}
