output "storage_account_id" {
  value = azurerm_storage_account.default.id
}

output "storage_account_key" {
  sensitive = true
  value = azurerm_storage_account.default.primary_access_key
}