resource "azurerm_route_table" "route_table_avd" {
  for_each            = local.snet_map_filtered_avd
  name                = lower("rt-${each.key}-${var.environment_short}-${var.location}-001")
  location            = azurerm_virtual_network.vnet_avd[each.value.vnet_name].location
  resource_group_name = azurerm_virtual_network.vnet_avd[each.value.vnet_name].resource_group_name
  provider            = azurerm.avd

  tags = local.tags
}

resource "azurerm_route" "rt_avd_route" {
  for_each = azurerm_route_table.route_table_avd

  name                   = "route-${each.key}-to-firewall"
  resource_group_name    = each.value.resource_group_name
  route_table_name       = each.value.name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall_ip
  provider               = azurerm.avd
}

resource "azurerm_subnet_route_table_association" "rt_association_avd" {
  for_each = local.snet_map_filtered_avd

  subnet_id      = azurerm_subnet.subnet_avd[each.key].id
  route_table_id = azurerm_route_table.route_table_avd[each.key].id
  provider       = azurerm.avd
}
