locals {
  name_prefix = "${var.org_name}-${var.environment}"

  common_tags = merge(var.tags, {
    environment = var.environment
  })
}

resource "azurerm_resource_group" "platform" {
  name     = "rg-${local.name_prefix}-platform"
  location = var.location
  tags     = local.common_tags
}

module "management_groups" {
  source = "./modules/management-groups"

  root_management_group_id = var.root_management_group_id
  management_groups        = var.management_groups
  allowed_locations        = var.allowed_locations
}

module "security" {
  source = "./modules/security"

  name_prefix         = local.name_prefix
  resource_group_name = azurerm_resource_group.platform.name
  location            = var.location
  log_retention_days  = var.log_retention_days
  tags                = local.common_tags
}

module "networking" {
  source = "./modules/networking"

  name_prefix            = local.name_prefix
  resource_group_name    = azurerm_resource_group.platform.name
  location               = var.location
  hub_address_space      = var.hub_address_space
  spoke_address_spaces   = var.spoke_address_spaces
  firewall_subnet_prefix = var.firewall_subnet_prefix
  log_analytics_id       = module.security.log_analytics_workspace_id
  tags                   = local.common_tags
}
