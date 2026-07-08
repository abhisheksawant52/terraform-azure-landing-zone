output "platform_resource_group" {
  description = "Name of the platform resource group."
  value       = azurerm_resource_group.platform.name
}

output "management_group_ids" {
  description = "Map of management group name to ID."
  value       = module.management_groups.management_group_ids
}

output "hub_vnet_id" {
  description = "Resource ID of the hub virtual network."
  value       = module.networking.hub_vnet_id
}

output "spoke_vnet_ids" {
  description = "Map of spoke name to VNet ID."
  value       = module.networking.spoke_vnet_ids
}

output "firewall_private_ip" {
  description = "Private IP of the Azure Firewall."
  value       = module.networking.firewall_private_ip
}

output "log_analytics_workspace_id" {
  description = "Resource ID of the Log Analytics workspace."
  value       = module.security.log_analytics_workspace_id
}
