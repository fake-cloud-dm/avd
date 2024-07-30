# Data block to retrieve the management group details
data "azurerm_management_group" "customer" {
  name = var.customer_name # Replace with your management group's name
}

data "azurerm_management_group" "connectivity" {
  name = "${var.customer_name}-connectivity" # Replace with your management group's name
}

data "azurerm_management_group" "identity" {
  name = "${var.customer_name}-identity" # Replace with your management group's name
}

data "azurerm_management_group" "management" {
  name = "${var.customer_name}-management" # Replace with your management group's name
}

data "azurerm_management_group" "platform" {
  name = "${var.customer_name}-platform" # Replace with your management group's name
}

data "azurerm_management_group" "landing-zones" {
  name = "${var.customer_name}-landing-zones" # Replace with your management group's name
}

data "azurerm_management_group" "corp" {
  name = "${var.customer_name}-corp" # Replace with your management group's name
}
