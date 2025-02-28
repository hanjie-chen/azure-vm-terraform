# windows vm varialbes

# windows vm setting varialbes
variable "windows_vm_name" {
  description = "the name of the windows virtual machine"
  default     = "Singapore-Windows-VM"
}

variable "windows_vm_size" {
  description = "the size of windows virutal machine: 4cpu, 16GB memory"
  default     = "Standard_D4s_v3"
}

variable "windows_vm_admin_username" {
  description = "the username of the windows machine"
  default     = "Plain"
}

variable "windows_vm_admin_password" {
  description = "Plain user password for the windows machine"
  type        = string
  sensitive   = true
}

# windows vm network varialbes settings
variable "windows_subnet_name" {
  description = "windows vm subnet name"
  default     = "windows-subnet"
}

variable "windows_subnet_nsg_name" {
  description = "windows subnet NSG name"
  default     = "windows-subnet-nsg"
}

variable "windows_subnet" {
  description = "windows subnet ip address space"
  default     = ["10.0.2.0/24"]
}
