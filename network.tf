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

# create vent subnet
resource "azurerm_subnet" "linux_subnet" {
  name                 = var.linux_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.linux_subnet
}

# craete public ip
resource "azurerm_public_ip" "linux_vm_public_ip" {
  name                = "${var.linux_vm_name}-public-ip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
}

# create linux subnet nsg
resource "azurerm_network_security_group" "linux_subnet_nsg" {
  name                = var.linux_subnet_nsg_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  # all ssh
  security_rule {
    name                       = "allow-ssh"
    description                = "allow ssh through the port 10499"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "10499"
    source_address_prefix      = "*"
    destination_address_prefix = var.linux_subnet[0]
  }
  # allow inbound 443 for proxy
  security_rule {
    name                       = "AllowAnyCustom443Inbound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = var.linux_subnet[0]
  }
}

# create nic
resource "azurerm_network_interface" "linux_vm_nic" {
  name                = "${var.linux_vm_name}-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.linux_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_vm_public_ip.id
  }
}

# associate nsg to linux sbuent
resource "azurerm_subnet_network_security_group_association" "linux_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.linux_subnet.id
  network_security_group_id = azurerm_network_security_group.linux_subnet_nsg.id
}
