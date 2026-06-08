module "resource_group" {
  source    = "../../modules/resource_group"
  rgs-vinav = var.rgs-vinav
}



module "storage_account" {
  depends_on      = [module.resource_group]
  source          = "../../modules/storage_account"
  storageAccounts = var.storage_accounts
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"

  vnet = var.vnet
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/subnet"
  subnet     = var.subnet
}
module "linux_vm" {
  depends_on = [
    module.subnet,
    module.key_vault # 👈 MOST IMPORTANT
  ]

  source                = "../../modules/linux_vm"
  linux_vm              = var.linux_vm
  network_interface_ids = module.nic.nic_ids
  key_vault_id          = module.key_vault.key_vault_ids["kv1"]
}

module "azurerm_container_registry" {
  depends_on = [module.linux_vm]

  source                     = "../../modules/acr"
  azurerm_container_registry = var.azurerm_container_registry
}


module "sql_server" {
  depends_on = [module.linux_vm]
  source     = "../../modules/sql_server"

  sql_servers = var.sql_servers
}
#  module "bastion" {
#    depends_on = [module.pip]
#    source     = "../../modules/bastion"

#    azurerm_bastion_host = var.azurerm_bastion_host
# }
module "pip" {
  source            = "../../modules/pip"
  depends_on        = [module.subnet]
  azurerm_public_ip = var.azurerm_public_ip

}
module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../../modules/NIC"

  nic = var.nic
  # Receive public IP ids from the pip module
  public_ip_ids = module.pip.public_ip_ids

}
module "key_vault" {
  depends_on = [
    module.resource_group # 👈 THIS IS THE FIX
  ]

  source = "../../modules/key_vault"

  azurerm_key_vaults = var.azurerm_key_vaults

  vm_admin_username = var.vm_admin_username
  vm_admin_password = var.vm_admin_password
}


module "lb" {
  depends_on = [module.pip]
  source     = "../../modules/load_balancer"

  lb = var.lb # ✅ matches module variable name
}
