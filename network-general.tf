# network.tf

# create resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_region
}

# create virtual network
resource "azurerm_virtual_network" "main" {
  name          = var.vnet_name
  address_space = var.vnet_address_space
  # inherit location, name from resource group
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
