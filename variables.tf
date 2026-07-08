variable "location" {
  description = "Primary Azure region."
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Environment name (dev, prod)."
  type        = string
  default     = "dev"
}

variable "org_name" {
  description = "Short organization identifier used in naming."
  type        = string
  default     = "acme"
}

variable "root_management_group_id" {
  description = "ID of the parent (tenant root or platform) management group."
  type        = string
  default     = "acme-platform"
}

variable "management_groups" {
  description = "Child management groups to create under the platform root."
  type        = list(string)
  default     = ["Platform", "LandingZones", "Sandbox", "Decommissioned"]
}

variable "allowed_locations" {
  description = "Regions allowed by the location-restriction policy."
  type        = list(string)
  default     = ["westeurope", "northeurope"]
}

variable "hub_address_space" {
  description = "Address space for the hub VNet."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "spoke_address_spaces" {
  description = "Address spaces for spoke VNets keyed by name."
  type        = map(list(string))
  default = {
    shared   = ["10.1.0.0/16"]
    workload = ["10.2.0.0/16"]
  }
}

variable "firewall_subnet_prefix" {
  description = "Prefix for the AzureFirewallSubnet in the hub VNet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "log_retention_days" {
  description = "Retention, in days, for the Log Analytics workspace."
  type        = number
  default     = 90
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    managed_by = "terraform"
    project    = "landing-zone"
  }
}
