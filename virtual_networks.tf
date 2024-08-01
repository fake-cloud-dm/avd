resource "azurerm_virtual_network" "vnet_avd" {
  for_each            = var.vnet_map
  address_space       = [each.value.address_space]
  name                = lower("vnet-${each.key}-${var.environment_short}-${var.location}-001")
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_avd["vnet-avd"].name
  dns_servers         = [var.dns_ip]
  tags                = local.tags
  provider            = azurerm.avd
}

##### VIRTUAL NETWORK PEERING #####

resource "azurerm_virtual_network_peering" "avd_to_hub" {
  name                      = "peer-${azurerm_virtual_network.vnet_avd["avd"].name}-to-${data.azurerm_virtual_network.hub.name}"
  resource_group_name       = azurerm_resource_group.rg_avd["vnet-avd"].name
  virtual_network_name      = azurerm_virtual_network.vnet_avd["avd"].name
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

}

resource "azurerm_virtual_network_peering" "hub_to_avd" {
  provider                  = azurerm.connectivity
  name                      = "peer-${data.azurerm_virtual_network.hub.name}-to-${azurerm_virtual_network.vnet_avd["avd"].name}"
  resource_group_name       = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_avd["avd"].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false

  depends_on = [
    azurerm_virtual_network.vnet_avd
  ]

}
