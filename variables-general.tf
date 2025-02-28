# general varialbes

variable "subscription_id" {
  description = "Azure subscription id"
  type = string
  sensitive = true
}

variable "resource_region" {
  description = "Azure resource location: Singapore"
  default     = "southeastasia"
}

variable "resource_group_name" {
  description = "resource group name"
  default     = "Singapore-RG"
}

# network setting
variable "vnet_name" {
  description = "virtual network name"
  default     = "Singapore-Vnet"
}

variable "vnet_address_space" {
  description = "virtual network address space"
  default     = ["10.0.0.0/16"]
}
