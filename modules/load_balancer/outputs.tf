output "lb_ids" {
  description = "The IDs of the load balancers."
  value       = { for k, v in azurerm_lb.lb : k => v.id }
}
