# Create a Virtual Machines
resource "azurerm_linux_virtual_machine" "ISTIO-VM" {
  for_each                        = toset(var.vm_name)
  name                            = each.value
  location                        = var.location
  resource_group_name             = azurerm_resource_group.rg.name
  size                            = "Standard_B2s"
  disable_password_authentication = false
  admin_username                  = "kaidan"
  admin_password                  = "yoursecretehere"
  computer_name                   = each.value
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    name                 = "osdisk-${each.key}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
} 