variable "root_management_group_id" {
  description = "ID of the parent management group."
  type        = string
}

variable "management_groups" {
  description = "Child management groups to create."
  type        = list(string)
}

variable "allowed_locations" {
  description = "Regions allowed by the location-restriction policy."
  type        = list(string)
}
