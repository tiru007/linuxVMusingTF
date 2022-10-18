resource "azurerm_virtual_network" "terra" {
  name                = "terra-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terra.location
  resource_group_name = azurerm_resource_group.terra.name
}

resource "azurerm_subnet" "terra" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.terra.name
  virtual_network_name = azurerm_virtual_network.terra.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "terra" {
  name                = "terra-machine01-pip"
  resource_group_name = azurerm_resource_group.terra.name
  location            = azurerm_resource_group.terra.location
  allocation_method   = "Static"
}