output "sql_server_ids" {
  description = "The IDs of the SQL Servers."
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.id }
}

output "sql_server_fqdns" {
  description = "The fully qualified domain names of the SQL Servers."
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.fully_qualified_domain_name }
}
