# linux-vm.tf

# create ubuntu linux virtual machine
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name = var.linux_vm_name
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  size = var.linux_vm_size

  network_interface_ids = [ azurerm_network_interface.linux_vm_nic.id ]

  # allow passowrd auth
  admin_username = var.linux_vm_admin_username
  admin_password = var.linux_vm_admin_password
  disable_password_authentication = false

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "ubuntu-24_04-lts"
    sku = "server"
    version = "latest"
  }
}