# general varialbes

variable "subscription_id" {
  description = "Azure subscription id"
  type = string
  sensitive = true
}

# resource group settings
variable "resource_region" {
  description = "Azure resource location: Singapore"
  default     = "southeastasia"
}

variable "resource_group_name" {
  description = "resource group name"
  default     = "Singapore-RG"
}

# virtual machien setting
variable "linux_vm_admin_password" {
  description = "Plain user password for the linux vm"
  type        = string
  sensitive   = true
}

variable "windows_vm_admin_password" {
  description = "Plain user password for the windows machine"
  type        = string
  sensitive   = true
}

# network setting
variable "vnet_name" {
  description = "virtual network name"
  default     = "Singapore-Vnet"
}