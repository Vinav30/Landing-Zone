variable "linux_vm" {
type = map(any)
  
}

variable "network_interface_ids" {
	description = "Map of network interface ids keyed by VM key"
	type        = map(string)
	default     = {}
}
variable "key_vault_id" {
  type = string
}
