# create resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_region
}

module "network" {
  source = "./modules/network"
  resource_group_name = var.resource_group_name
  resource_region = var.resource_region
  vnet_name = var.vnet_name
}

module "linux_vm" {
  source = "./modules/linux-vm"
  resource_group_name = var.resource_group_name
  resource_region = var.resource_region
  linux_vm_admin_password = var.linux_vm_admin_password
  vnet_name = var.vnet_name
}

module "windows_vm" {
  source = "./modules/windows-vm"
  resource_group_name = var.resource_group_name
  resource_region = var.resource_region
  windows_vm_admin_password = var.windows_vm_admin_password
  vnet_name = var.vnet_name
}