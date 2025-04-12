# linux VM network setting

# create linux subnet
resource "azurerm_subnet" "linux_subnet" {
  name                 = var.linux_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.linux_subnet
}

# craete linux public ip
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
  # security_rule {
  #   name                       = "AllowAnyCustom443Inbound"
  #   priority                   = 110
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "443"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = var.linux_subnet[0]
  # }

  # allow inbound 20000~50000 for proxy
  security_rule {
    name                       = "AllowProxyInbound"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "20000-50000"
    source_address_prefix      = "*"
    destination_address_prefix = var.linux_subnet[0]
  }

  # allow inbound 80 for AFD access
  # security_rule {
  #   name                       = "AllowAnyCustom80Inbound"
  #   priority                   = 120
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "80"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = var.linux_subnet[0]
  # }
}

# create linux nic
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

# associate nsg to linux subnet
resource "azurerm_subnet_network_security_group_association" "linux_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.linux_subnet.id
  network_security_group_id = azurerm_network_security_group.linux_subnet_nsg.id
}