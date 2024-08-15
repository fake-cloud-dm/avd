resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  for_each = var.storage_account_map

  name                  = "${azurerm_virtual_network.vnet_avd["avd"].name}-link-to-${data.azurerm_private_dns_zone.existing_private_dns_file.name}"
  resource_group_name   = data.azurerm_private_dns_zone.existing_private_dns_file.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.existing_private_dns_file.name
  virtual_network_id    = azurerm_virtual_network.vnet_avd["avd"].id

  tags = local.tags

  #   depends_on = [azurerm_private_dns_zone.private_dns]
  provider = azurerm.connectivity
}
