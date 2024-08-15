locals {
  #Tags
  tags = {
    "Application" = "${var.application}"
    "Criticality" = "${var.criticality}"
    "Environment" = "${var.environment}"
    "Owner"       = "${var.org}"
  }

  # Environment specific tags
  environment_tags = {
    development = {
      "Criticality" = "Tier 2"
      "Environment" = "Development"
    },
    uat = {
      "Criticality" = "Tier 2"
      "Environment" = "UAT"
    },
    # Add other environments as needed
  }

  management_group_map = {
    "Customer"      = data.azurerm_management_group.customer.id
    "Platform"      = data.azurerm_management_group.platform.id
    "landing-zones" = data.azurerm_management_group.landing-zones.id
    "Connectivity"  = data.azurerm_management_group.connectivity.id
    "Management"    = data.azurerm_management_group.management.id
    "Identity"      = data.azurerm_management_group.identity.id
    "Corp"          = data.azurerm_management_group.corp.id
  }

  providers = {
    connectivity = "azurerm.connectivity"
    management   = "azurerm.management"
    identity     = "azurerm.identity"
    production   = "azurerm.production"
    development  = "azurerm.development"
    uat          = "azurerm.uat"
  }

  snet_map_filtered_avd = { for k, v in var.subnet_map : k => v if can(regex("avd", v.vnet_name)) }

  vm_details = [{
    #Base Image VM Details
    vmname = "vm-img-uks-001"
    vmsize = "Standard_D2s_v5"
    vmzone = "1"
  }]

}

