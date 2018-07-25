output "thumbprint" {
  value = "${azurerm_template_deployment.module_az_arm_webapp_certificate_main.outputs["thumbprint"]}"
}

output "resource_group_name" {
  value = "${var.resource_group_name}"
}
