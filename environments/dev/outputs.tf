output "resource_group_ids" {
  description = "The IDs of the resource groups."
  value       = module.resource_group.rg_ids
}

output "storage_account_ids" {
  description = "The IDs of the storage accounts."
  value       = module.storage_account.storage_account_ids
}

output "vnet_ids" {
  description = "The IDs of the virtual networks."
  value       = module.virtual_network.vnet_ids
}

output "subnet_ids" {
  description = "The IDs of the subnets."
  value       = module.subnet.subnet_ids
}

output "public_ip_ids" {
  description = "The IDs of the public IP addresses."
  value       = module.pip.public_ip_ids
}

output "public_ip_addresses" {
  description = "The public IP addresses."
  value       = module.pip.public_ip_addresses
}


output "nic_ids" {
  description = "The IDs of the network interfaces."
  value       = module.nic.nic_ids
}

output "key_vault_ids" {
  description = "The IDs of the key vaults."
  value       = module.key_vault.key_vault_ids
}

output "load_balancer_ids" {
  description = "The IDs of the load balancers."
  value       = module.lb.lb_ids
}

output "linux_vm_ids" {
  description = "The IDs of the Linux Virtual Machines."
  value       = module.linux_vm.linux_vm_ids
}

output "linux_vm_private_ips" {
  description = "The private IP addresses of the Linux Virtual Machines."
  value       = module.linux_vm.linux_vm_private_ips
}

output "acr_ids" {
  description = "The IDs of the Azure Container Registries."
  value       = module.azurerm_container_registry.acr_ids
}

output "acr_login_servers" {
  description = "The login servers of the Azure Container Registries."
  value       = module.azurerm_container_registry.acr_login_servers
}

output "sql_server_ids" {
  description = "The IDs of the SQL Servers."
  value       = module.sql_server.sql_server_ids
}

output "sql_server_fqdns" {
  description = "The fully qualified domain names of the SQL Servers."
  value       = module.sql_server.sql_server_fqdns
}
output "bastion_ids" {
  description = "The IDs of the Bastion Hosts."
  value       = module.bastion.bastion_ids
}
