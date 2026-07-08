variable "name_prefix" {
  description = "Prefix applied to networking resource names."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to deploy into."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "hub_address_space" {
  description = "Address space for the hub VNet."
  type        = list(string)
}

variable "spoke_address_spaces" {
  description = "Address spaces for spoke VNets keyed by name."
  type        = map(list(string))
}

variable "firewall_subnet_prefix" {
  description = "Prefix for the AzureFirewallSubnet."
  type        = string
}

variable "log_analytics_id" {
  description = "Log Analytics workspace ID for firewall diagnostics."
  type        = string
}

variable "tags" {
  description = "Tags applied to resources."
  type        = map(string)
  default     = {}
}
