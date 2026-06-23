 resource "azurerm_bastion_host" "vinav_bastion" {
     for_each = var.azurerm_bastion_host
   name                = each.value.name
   location            = each.value.location
   resource_group_name = each.value.resource_group_name
   ip_configuration {
     name                = each.value.ip_configuration.name
     subnet_id            = each.value.ip_configuration.subnet_id
     public_ip_address_id = each.value.ip_configuration.public_ip_address_id
   }
 }