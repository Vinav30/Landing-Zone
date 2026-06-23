output "subnet_ids" {
  description = "The IDs of the subnets."
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}
