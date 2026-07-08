location    = "westeurope"
environment = "dev"
org_name    = "acme"

root_management_group_id = "acme-platform"
management_groups        = ["Platform", "LandingZones", "Sandbox", "Decommissioned"]
allowed_locations        = ["westeurope", "northeurope"]

hub_address_space = ["10.0.0.0/16"]
spoke_address_spaces = {
  shared   = ["10.1.0.0/16"]
  workload = ["10.2.0.0/16"]
}
firewall_subnet_prefix = "10.0.1.0/24"

log_retention_days = 30
