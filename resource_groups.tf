resource "azurerm_resource_group" "rg_avd" {
  for_each = var.resource_group_map
  name     = lower("rg-${each.key}-${var.environment_short}-${var.location}-001")
  location = var.location
  tags     = local.tags
  provider = azurerm.avd
}
