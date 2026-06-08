variable "azurerm_key_vaults" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "vm_admin_username" {
  type      = string
  sensitive = true
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}
