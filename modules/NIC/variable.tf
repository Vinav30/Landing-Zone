variable "nic" {
    description = "A map of NIC configurations."
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        subnet_id           = string
    }))
  
}

variable "public_ip_ids" {
    description = "Map of public IP ids keyed by the same keys as nic"
    type        = map(string)
    default     = {}
}