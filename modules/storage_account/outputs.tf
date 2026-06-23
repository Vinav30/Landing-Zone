output "storage_account_ids" {
  description = "The IDs of the storage accounts."
  value       = { for k, v in azurerm_storage_account.storageAccounts : k => v.id }
}

output "storage_account_primary_endpoints" {
  description = "The primary endpoints of the storage accounts."
  value       = { for k, v in azurerm_storage_account.storageAccounts : k => v.primary_blob_endpoint }
}
