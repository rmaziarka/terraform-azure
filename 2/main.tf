provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.6.0"
  features {}
}

resource "azurerm_resource_group" "default" {
  name     = "terraform-azure"
  location = "West Europe"
}

resource "azurerm_virtual_network" "default" {
  name                = "terraform-azure-network"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "default" {
  name                 = "subnetname"
  resource_group_name  = azurerm_resource_group.default.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefix       = "10.0.2.0/24"
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}

resource "azurerm_storage_account" "default" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.default.name

  location                 = azurerm_resource_group.default.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.default.id]
  }

  tags = {
    environment = "staging"
  }
}