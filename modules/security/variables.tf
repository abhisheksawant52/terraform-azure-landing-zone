variable "name_prefix" {
  description = "Prefix applied to security resource names."
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

variable "log_retention_days" {
  description = "Retention, in days, for the Log Analytics workspace."
  type        = number
  default     = 90
}

variable "tags" {
  description = "Tags applied to resources."
  type        = map(string)
  default     = {}
}
