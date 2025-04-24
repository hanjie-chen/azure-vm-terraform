output "linux_vm_public_ip" {
  description = "Singapore Linux VM public ip"
  value = azurerm_public_ip.linux_vm_public_ip.ip_address
}

output "linux_vm_private_ip" {
  description = "Singapore Linux VM private ip"
  value = azurerm_network_interface.linux_vm_nic.ip_configuration[0].private_ip_address
}