variable "rgs-vinav" {
  type = map(any)
}
variable "storage_accounts" {
  type = map(any)
}
variable "vnet" {
  type = map(any)

}
variable "subnet" {
  type = map(any)

}
variable "linux_vm" {
  type = map(any)
}
variable "azurerm_container_registry" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool

  }))
}
variable "aks" {
  description = "AKS cluster configuration map"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
  }))
}
variable "sql_servers" {
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    version                      = string
  }))
}
# variable "azurerm_bastion_host" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     ip_configuration = object({
#       name                 = string
#       subnet_id            = string
#       public_ip_address_id = string
#     })
#   }))

# }
variable "azurerm_public_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}
variable "nic" {
  description = "A map of NIC configurations."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = string
  }))

}
variable "azurerm_key_vaults" {
  description = "A map of key vaults to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))

}
variable "lb" {
  description = "Map of Load Balancer configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    frontend_ip_configuration = list(object({
      name                 = string
      public_ip_address_id = string
    }))
  }))
}
variable "nsg" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
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
