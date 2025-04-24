# modules/network/outputs.tf

output "vnet_id" {
  value       = azurerm_virtual_network.main.id
  description = "The ID of the virtual network"
}