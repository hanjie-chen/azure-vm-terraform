# network setting
variable "vnet_name" {
  description = "virtual network name"
  type = string
}

variable "vnet_address_space" {
  description = "virtual network address space"
  default     = ["10.0.0.0/16"]
}

variable "resource_group_name" {
  description = "Name of resource group"
  type = string
}

variable "resource_region" {
  description = "Azure resource region"
  type = string
}