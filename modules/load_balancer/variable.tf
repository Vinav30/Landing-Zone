variable "lb" {
  description = "Map of Load Balancer configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    frontend_ip_configuration = list(object({
      name                 = string
      public_ip_address_id = string
    }))
  }))
}
