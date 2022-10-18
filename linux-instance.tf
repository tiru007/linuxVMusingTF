resource "azurerm_network_interface" "terra" {
  name                = "terra-nic"
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terra.id
  }
}

resource "azurerm_linux_virtual_machine" "terra" {
  name                = "terra-machine01"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group.terra.location
  size                = "Standard_D2_v2"
  admin_username      = "linuxadmin"
  network_interface_ids = [
    azurerm_network_interface.terra.id,
  ]

  admin_ssh_key {
    username   = "trainer"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}