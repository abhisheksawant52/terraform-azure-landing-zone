resource "azurerm_management_group" "children" {
  for_each = toset(var.management_groups)

  display_name               = each.value
  name                       = lower(each.value)
  parent_management_group_id = "/providers/Microsoft.Management/managementGroups/${var.root_management_group_id}"
}

# Policy definition: restrict resource deployment to allowed regions.
resource "azurerm_policy_definition" "allowed_locations" {
  name                = "allowed-locations"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "Allowed locations"
  management_group_id = "/providers/Microsoft.Management/managementGroups/${var.root_management_group_id}"

  policy_rule = jsonencode({
    if = {
      not = {
        field = "location"
        in    = "[parameters('allowedLocations')]"
      }
    }
    then = {
      effect = "deny"
    }
  })

  parameters = jsonencode({
    allowedLocations = {
      type = "Array"
      metadata = {
        displayName = "Allowed locations"
        description = "The list of allowed regions for resources."
      }
    }
  })
}

resource "azurerm_management_group_policy_assignment" "allowed_locations" {
  name                 = "allowed-locations"
  display_name         = "Restrict resource regions"
  management_group_id  = "/providers/Microsoft.Management/managementGroups/${var.root_management_group_id}"
  policy_definition_id = azurerm_policy_definition.allowed_locations.id

  parameters = jsonencode({
    allowedLocations = {
      value = var.allowed_locations
    }
  })
}

# Built-in initiative: Azure Security Benchmark applied org-wide.
resource "azurerm_management_group_policy_assignment" "security_benchmark" {
  name                 = "asb"
  display_name         = "Azure Security Benchmark"
  management_group_id  = "/providers/Microsoft.Management/managementGroups/${var.root_management_group_id}"
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
}
