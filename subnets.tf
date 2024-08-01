resource "azurerm_subnet" "subnet_avd" {
  for_each             = var.subnet_map
  address_prefixes     = [each.value.address_prefixes]
  name                 = lower("snet-${each.key}-${var.environment_short}-${var.location}-001")
  resource_group_name  = azurerm_virtual_network.vnet_avd[each.value.vnet_name].resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_avd[each.value.vnet_name].name
  provider             = azurerm.avd
}
