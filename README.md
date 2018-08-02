# tf-module-azurerm-template-app-service-certificate

Terraform module designed to add a certificate to an existing Azure PaaS Service Plan.

## Usage

### Sample
Include this repository as a module in your existing terraform code:

```hcl

data "azurerm_key_vault" "test" {
  name                = "mykeyvault"
  resource_group_name = "some-resource-group"
}

data "azurerm_app_service_plan" "test" {
  name                = "testing-app-service-plan"
  resource_group_name = "testing-service-rg"
}

module "eg_add_certificate" {
  source     = "git::https://github.com/transactiveltd/tf-module-azure-arm-certificate.git?ref=master"
  certificate_name     = "mysslcertificte"
  service_plan_name    = "${data.azurermazurerm_app_service_plan_key_vault.test.name}"
  keyvault_id          = "${data.azurerm_key_vault.test.id}"
  resource_group_name  = "testing-service-rg"
}
```

This will run an arm template deployment on the given resource group, get the certificate from the keyvault and add it to the service plan.
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| certificate_name | Certifcate Name, e.g. `myCertName` | string | - | yes |
| service_plan_id | Azure Resouce Id path | string | - | yes |
| keyvault_id | Azure Resouce Id path  | string | - | yes |
| resource_group_name | Resource Group name, e.g. `testing-service-rg` | string | - | yes |


## Outputs

| Name | Description |
|------|-------------|
| thumprint | Certificate Thumbprint |
