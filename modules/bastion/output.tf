output "bastion_ids" {
  value = {
    for k, v in azurerm_bastion_host.vinav_bastion :
    k => v.id
  }
}