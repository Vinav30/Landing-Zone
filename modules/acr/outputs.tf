output "acr_ids" {
  description = "The IDs of the Azure Container Registries."
  value       = { for k, v in azurerm_container_registry.acr : k => v.id }
}

output "acr_login_servers" {
  description = "The login servers of the Azure Container Registries."
  value       = { for k, v in azurerm_container_registry.acr : k => v.login_server }
}
