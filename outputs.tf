output "thumbprint" {
  value = "${azurerm_template_deployment.service_app_certificate_main.outputs["thumbprint"]}"
}

output "resource_group_name" {
  value = "${var.resource_group_name}"
}
