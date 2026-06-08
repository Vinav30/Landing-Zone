output "key_vault_ids" {
  value = {
    for k, v in azurerm_key_vault.vinavault : k => v.id
  }
}
