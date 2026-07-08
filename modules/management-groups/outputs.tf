output "management_group_ids" {
  description = "Map of management group display name to resource ID."
  value       = { for k, v in azurerm_management_group.children : k => v.id }
}

output "allowed_locations_policy_id" {
  description = "ID of the allowed-locations policy definition."
  value       = azurerm_policy_definition.allowed_locations.id
}
