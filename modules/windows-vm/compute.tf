# create windows vm

# create windows 10 virtual machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
  name = var.windows_vm_name
  # for widnows special 15 character limit computer_name
  computer_name       = "SG-Win-VM"
  resource_group_name = var.resource_group_name
  location            = var.resource_region
  size                = var.windows_vm_size

  network_interface_ids = [azurerm_network_interface.windows_vm_nic.id]

  # allow password auth
  admin_username = var.windows_vm_admin_username
  admin_password = var.windows_vm_admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "win10-22h2-pro-g2"
    version   = "latest"
  }
  identity {
    type = "SystemAssigned"
  }
}
