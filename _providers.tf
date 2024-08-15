provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.hub_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.mgmt_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "avd"
  subscription_id = var.avd_subscription_id
  features {}
}

provider "random" {}

provider "azuread" {
  tenant_id = var.tenant_id
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}
