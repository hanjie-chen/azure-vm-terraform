# create windows vm

# create windows 10 virtual machine
resource "azurerm_windows_virtual_machine" "windows_vm" {
    name = var.windows_vm_name
    resource_group_name = azurerm_resource_group.main.name
    location = azurerm_resource_group.main.location
    size = var.windows_vm_size

    network_interface_ids = [ azurerm_network_interface.windows_vm_nic.id ]

    # allow password auth
    admin_username = var.windows_vm_admin_username
    admin_password = var.windows_vm_admin_password
    
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "StandardSSD_LRS"
    }

    source_image_reference {
      publisher = "MicrosoftWindowsDesktop"
      offer = "Windows-10"
      sku = "win10-22h2-pro-g2"
      version = "latest"
    }
  
}