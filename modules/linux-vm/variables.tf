# linux vm varialbes

# linux vm seting varialbes
variable "linux_vm_name" {
  description = "the name of linux virtual machine"
  default     = "Singapore-Linux-VM"
}

variable "linux_vm_size" {
  description = "the size of linux virutal machine"
  default     = "Standard_D2s_v3"
}

variable "linux_vm_admin_username" {
  description = "the username of the linux machine"
  default     = "Plain"
}

variable "linux_vm_admin_password" {
  description = "Plain user password for the linux vm"
  type        = string
  sensitive   = true
}

#linux vm network varialbes settings
variable "linux_subnet_name" {
  description = "linux vm subnet net name"
  default     = "linux-subnet"
}

variable "linux_subnet_nsg_name" {
  description = "linux subnet network security group name"
  default     = "linux-subnet-nsg"
}

variable "linux_subnet" {
  description = "linux subnet ip address space"
  default     = ["10.0.1.0/24"]
}

variable "vnet_name" {
  description = "virtual network name"
  type = string
}

# resource group varilabes
variable "resource_group_name" {
  description = "Name of resource group"
  type = string
}

variable "resource_region" {
  description = "Azure resource region"
  type = string
}