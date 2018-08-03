variable "certificate_name" {
  type = "string"
}

variable "keyvault_id" {
  type = "string"
}

variable "service_plan_name" {
  type = "string"
}

variable "resource_group_name" {
  description = "Azure Group Name"
  type        = "string"
}
variable depends_on { default = [], type = "list"}