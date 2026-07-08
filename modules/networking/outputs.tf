output "hub_vnet_id" {
  description = "Resource ID of the hub VNet."
  value       = azurerm_virtual_network.hub.id
}

output "spoke_vnet_ids" {
  description = "Map of spoke name to VNet ID."
  value       = { for k, v in azurerm_virtual_network.spoke : k => v.id }
}

output "firewall_private_ip" {
  description = "Private IP of the Azure Firewall."
  value       = azurerm_firewall.hub.ip_configuration[0].private_ip_address
}
