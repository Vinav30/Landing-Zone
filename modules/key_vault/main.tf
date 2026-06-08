data "azurerm_client_config" "example" {}

resource "azurerm_key_vault" "vinavault" {
    for_each = var.azurerm_key_vaults
  name                = each.value.name

  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tenant_id           = data.azurerm_client_config.example.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.example.tenant_id
    object_id = data.azurerm_client_config.example.object_id

    secret_permissions = ["Get", "List", "Set", "Delete", "Purge"]
  }
}
resource "azurerm_key_vault_secret" "vm_username" {
  for_each     = azurerm_key_vault.vinavault
  name         = "vm-admin-username"
  value        = var.vm_admin_username
  key_vault_id = each.value.id
}

resource "azurerm_key_vault_secret" "vm_password" {
  for_each     = azurerm_key_vault.vinavault
  name         = "vm-admin-password"
  value        = var.vm_admin_password
  key_vault_id = each.value.id
}

