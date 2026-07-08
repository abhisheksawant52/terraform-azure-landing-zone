terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.80"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47"
    }
  }

  # Remote state backend. Configure per environment with a partial backend:
  #   terraform init -backend-config=environments/dev/backend.hcl
  #
  # backend "azurerm" {
  #   resource_group_name  = "rg-tfstate"
  #   storage_account_name = "acmetfstate"
  #   container_name       = "landing-zone"
  #   key                  = "landing-zone.tfstate"
  # }
}
