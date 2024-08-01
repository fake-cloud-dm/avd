# Data block to retrieve the management group details
data "azurerm_management_group" "customer" {
  name = var.customer_name
}

data "azurerm_management_group" "connectivity" {
  name = "${var.customer_name}-connectivity"
}

data "azurerm_management_group" "identity" {
  name = "${var.customer_name}-identity"
}

data "azurerm_management_group" "management" {
  name = "${var.customer_name}-management"
}

data "azurerm_management_group" "platform" {
  name = "${var.customer_name}-platform"
}

data "azurerm_management_group" "landing-zones" {
  name = "${var.customer_name}-landing-zones"
}

data "azurerm_management_group" "corp" {
  name = "${var.customer_name}-corp"
}

##### HUB VNET #####
data "azurerm_virtual_network" "hub" {
  provider            = azurerm.connectivity
  name                = "vnet-hub-prod-uksouth-001"
  resource_group_name = "rg-hub-prod-uksouth-001"
}

data "azurerm_private_dns_zone" "existing_private_dns_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.dns_zone_resource_group_name
  provider            = azurerm.connectivity
}
