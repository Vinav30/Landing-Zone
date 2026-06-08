output "nic_ids" {
  description = "Map of network interface ids keyed by NIC key"
  value = { for o, v in azurerm_network_interface.nic : o => v.id }
}
