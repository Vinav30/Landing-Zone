output "linux_vm_ids" {
  description = "The IDs of the Linux Virtual Machines."
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "linux_vm_private_ips" {
  description = "The private IP addresses of the Linux Virtual Machines."
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.private_ip_address }
}

output "linux_vm_public_ips" {
  description = "The public IP addresses of the Linux Virtual Machines."
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.public_ip_address }
}
