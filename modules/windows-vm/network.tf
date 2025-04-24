# windows VM network setting

# create windows subnet
resource "azurerm_subnet" "windows_subnet" {
  name                 = var.windows_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.windows_subnet
}

# create windows public ip
resource "azurerm_public_ip" "windows_vm_public_ip" {
  name                = "${var.windows_vm_name}-public-ip"
  location            = var.resource_region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# create windows subnet nsg
resource "azurerm_network_security_group" "windows_subnet_nsg" {
  name                = var.windows_subnet_nsg_name
  location            = var.resource_region
  resource_group_name = var.resource_group_name

  # inbound security rule
  # all RDP 10499 tcp port
  security_rule {
    name                       = "allow-RDP-tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "10499"
    source_address_prefix      = "*"
    destination_address_prefix = var.windows_subnet[0]
  }
  # all RDP 10499 udp port
  security_rule {
    name                       = "allow-RDP-udp"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "10499"
    source_address_prefix      = "*"
    destination_address_prefix = var.windows_subnet[0]
  }
}

# create windows vm nic
resource "azurerm_network_interface" "windows_vm_nic" {
  name                = "${var.windows_vm_name}-nic"
  location            = var.resource_region
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.windows_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_vm_public_ip.id
  }
}

# associate nsg to windows subnet
resource "azurerm_subnet_network_security_group_association" "windows_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.windows_subnet.id
  network_security_group_id = azurerm_network_security_group.windows_subnet_nsg.id
}
