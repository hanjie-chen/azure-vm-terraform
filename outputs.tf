# output.tf

output "linux_vm_public_ip" {
  description = "Singapore Linux VM public ip"
  value = azurerm_public_ip.linux_vm_public_ip.ip_address
}

output "linux_vm_private_ip" {
  description = "Singapore Linux VM private ip"
  value = azurerm_network_interface.linux_vm_nic.ip_configuration[0].private_ip_address
}

output "linux_vm_admin_username" {
  description = "Singapore Linux VM admin username"
  value = azurerm_linux_virtual_machine.linux_vm.admin_username
}

output "linux_vm_id" {
  description = "Singapore Linux VM resource id"
  value = azurerm_linux_virtual_machine.linux_vm.id
}