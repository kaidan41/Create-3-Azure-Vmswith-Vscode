resource "azurerm_network_security_group" "ISTIO-VM" {
  name                = var.nsg
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "177.143.69.241/32"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Istio-Lab"
  }
  depends_on = [azurerm_network_interface.nic ]
}

resource "azurerm_subnet_network_security_group_association" "mgmt-nsg-association" {
    subnet_id                 = azurerm_subnet.subnet.id
    network_security_group_id = azurerm_network_security_group.ISTIO-VM.id
}