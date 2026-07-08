output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "key_vault_id" {
  description = "Resource ID of the platform Key Vault."
  value       = azurerm_key_vault.platform.id
}
