provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.6.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-azure"
    storage_account_name = "terraformazuretest"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "default" {
  name     = "terraform-azure"
  location = "West Europe"
}

resource "azurerm_storage_account" "default" {
  name                     = "terraformazuretest"
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "default" {
  name                  = "terraform"
  storage_account_name  = azurerm_storage_account.default.name
  container_access_type = "private"
}













