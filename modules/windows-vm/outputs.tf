# output for windows vm
output "windows_vm_public_ip" {
  description = "Singapore Windows VM public ip"
  value = azurerm_public_ip.windows_vm_public_ip.ip_address
}

output "windows_vm_private_ip" {
  description = "Singapore Windows VM private ip"
  value = azurerm_network_interface.windows_vm_nic.ip_configuration[0].private_ip_address
}