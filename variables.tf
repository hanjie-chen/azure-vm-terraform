# varialbes.tf 

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

# linux vitual machine seeting
variable "vnet_name" {
  description = "virtual network name"
  default     = "Singapore-Vnet"
}

variable "linux_vm_name" {
  description = "the name of linux virtual machine"
  default     = "Singapore-Linux-VM"
}

variable "linux_vm_size" {
  description = "the size of linux virutal machine"
  default = "Standard_D2s_v3"
}

variable "linux_vm_admin_username" {
  description = "the username of the linux machine"
  default = "Plain"
}

variable "linux_vm_admin_password" {
  description = "Plain user password for the linux vm"
  type = string
  sensitive = true
}

# network varialbes settings
variable "linux_subnet_name" {
  description = "linux subnet net name"
  default     = "linux-subnet"
}

variable "linux_subnet_nsg_name" {
  description = "linux subnet network security group name"
  default     = "linux-subnet-nsg"
}

variable "vnet_address_space" {
  description = "virtual network address space"
  default     = ["10.0.0.0/16"]
}

variable "linux_subnet" {
  description = "linux subnet ip address space"
  default     = ["10.0.1.0/24"]
}
