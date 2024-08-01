resource "azurerm_network_security_group" "nsg_avd" {
  for_each = local.snet_map_filtered_avd

  name                = lower("nsg-${each.key}-${var.environment_short}-${var.location}-001")
  location            = azurerm_virtual_network.vnet_avd[each.value.vnet_name].location
  resource_group_name = azurerm_virtual_network.vnet_avd[each.value.vnet_name].resource_group_name
  provider            = azurerm.avd

  # security_rule {
  #   name                       = "allow_ssh"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "22"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }

  tags = local.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_association_avd" {
  for_each = local.snet_map_filtered_avd

  subnet_id                 = azurerm_subnet.subnet_avd[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_avd[each.key].id
  provider                  = azurerm.avd
}
