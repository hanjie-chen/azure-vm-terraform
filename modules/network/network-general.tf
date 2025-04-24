# network.tf

# create virtual network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.resource_region
  resource_group_name = var.resource_group_name
}
