resource "azurerm_network_interface" "nic" {
  for_each = var.nic

  name                = "${each.value.name}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.name}-ipconfig"
    subnet_id                     =  each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    # Public IPs are created in the pip module. Accept public IP ids via a variable
    public_ip_address_id          = lookup(var.public_ip_ids, each.key, null)
  }
}

