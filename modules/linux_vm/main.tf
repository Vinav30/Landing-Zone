data "azurerm_key_vault_secret" "vm_username" {
  name         = "vm-admin-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-admin-password"
  key_vault_id = var.key_vault_id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.linux_vm

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  admin_username = data.azurerm_key_vault_secret.vm_username.value
  admin_password = data.azurerm_key_vault_secret.vm_password.value

  network_interface_ids = [
      var.network_interface_ids[each.key]
  ]

  os_disk {
    name                 = "${each.value.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  disable_password_authentication = false
}
