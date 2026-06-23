output "rg_ids" {
  description = "The IDs of the resource groups."
  value       = { for k, v in azurerm_resource_group.rgs-vinav : k => v.id }
}

output "rg_names" {
  description = "The names of the resource groups."
  value       = { for k, v in azurerm_resource_group.rgs-vinav : k => v.name }
}
