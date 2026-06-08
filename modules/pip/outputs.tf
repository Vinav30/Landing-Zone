output "public_ip_ids" {
  description = "Map of public ip ids keyed by input keys"
  value = { for k, v in azurerm_public_ip.vinav_pip : k => v.id }
}
