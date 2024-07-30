resource "azurerm_virtual_network" "vnet_connectivity" {
  for_each            = var.vnet_map
  address_space       = [each.value.address_space]
  name                = lower("vnet-${each.key}-${var.environment_short}-${each.value.location}-001")
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_avd["vnet-avd"].name
  dns_servers         = var.firewall_ip
  tags                = local.tags
  provider            = azurerm.avd
}
