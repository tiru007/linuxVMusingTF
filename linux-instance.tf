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
  name                = "${var.hostname}"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group .terra.location
  size                = "${var.vm_size}"
  admin_username      = "${var.admin_username}"
  network_interface_ids = [
    azurerm_network_interface.terra.id,
  ]

  admin_ssh_key {
    username   = "${var.admin_username}"
    public_key = file("${var.ssh_public_key}")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "${var.storage_account_type}"
  }

  source_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }
}