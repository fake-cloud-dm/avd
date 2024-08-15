##### AVD WORKSPACE #####
resource "azurerm_virtual_desktop_workspace" "workspace" {
  for_each = var.hostpool_details

  name          = each.value.workspace_name
  friendly_name = each.value.workspace_name
  description   = each.value.workspace_name

  resource_group_name = azurerm_resource_group.rg_avd["avd"].name
  location            = azurerm_resource_group.rg_avd["avd"].location
  tags                = local.tags

  provider = azurerm.avd
}

##### AVD HOST POOL #####
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  for_each = var.hostpool_details

  name                     = each.value.name
  friendly_name            = each.value.friendly_name
  description              = each.value.name
  validate_environment     = each.value.validate_environment
  start_vm_on_connect      = each.value.start_vm_on_connect
  preferred_app_group_type = each.value.preferred_app_group_type
  type                     = each.value.type
  custom_rdp_properties    = each.value.custom_rdp_properties
  maximum_sessions_allowed = each.value.maximum_sessions_allowed
  load_balancer_type       = each.value.load_balancer_type

  resource_group_name = azurerm_resource_group.rg_avd["avd"].name
  location            = azurerm_resource_group.rg_avd["avd"].location
  tags                = local.tags

  provider = azurerm.avd
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "hostpool_reginfo" {
  for_each = var.hostpool_details

  hostpool_id     = azurerm_virtual_desktop_host_pool.hostpool[each.key].id
  expiration_date = timeadd(timestamp(), "719h")

  lifecycle {
    ignore_changes = all
  }

  provider = azurerm.avd
}

##### AVD APPLICATION GROUP AND ASSOCIATION #####
resource "azurerm_virtual_desktop_application_group" "app_group" {
  for_each = var.hostpool_details

  name          = each.value.application_group_name
  type          = each.value.application_group_type
  host_pool_id  = azurerm_virtual_desktop_host_pool.hostpool[each.key].id
  friendly_name = each.value.application_group_name
  description   = "${each.value.application_group_name} - Application Group"

  resource_group_name = azurerm_resource_group.rg_avd["avd"].name
  location            = azurerm_resource_group.rg_avd["avd"].location
  tags                = local.tags

  provider = azurerm.avd
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "workspace_assoc" {
  for_each             = var.hostpool_details
  workspace_id         = azurerm_virtual_desktop_workspace.workspace[each.key].id
  application_group_id = azurerm_virtual_desktop_application_group.app_group[each.key].id

  provider = azurerm.avd
}
