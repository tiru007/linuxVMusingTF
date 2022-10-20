resource "azurerm_virtual_network" "terra" {
  name                = "terra-vnet"
  address_space       = ["${var.vnet_address_space}"]
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name
}

resource "azurerm_subnet" "terra" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.terra.name
  virtual_network_name = azurerm_virtual_network.terra.name
  address_prefixes     = ["${var.subnet_address_space}"]
}

resource "azurerm_public_ip" "terra" {
  name                = "terra-machine01-pip"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group.terra.location
  allocation_method   = "Static"
}