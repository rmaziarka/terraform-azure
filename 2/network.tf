resource "azurerm_virtual_network" "first" {
  name                = local.first_network_name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = var.first_network_address_space
}

resource "azurerm_virtual_network" "second" {
  name                = local.second_network_name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = var.second_network_address_space
}