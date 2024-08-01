resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_account_map

  name                          = lower("${each.key}")
  resource_group_name           = azurerm_resource_group.rg_avd["fslogix"].name
  location                      = var.location
  account_kind                  = each.value.account_kind
  account_tier                  = each.value.account_tier
  account_replication_type      = each.value.account_replication_type
  public_network_access_enabled = each.value.public == "true"
  tags                          = local.tags
  provider                      = azurerm.avd
}

resource "azurerm_storage_container" "storage_container" {
  for_each = var.storage_account_map

  name                  = each.value.container
  storage_account_name  = azurerm_storage_account.storage_account[each.key].name
  container_access_type = "private"
  provider              = azurerm.avd
}

resource "azurerm_private_endpoint" "pe" {
  for_each = var.storage_account_map

  name                = "pep-${each.key}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_avd["fslogix"].name
  subnet_id           = azurerm_subnet.subnet_avd["fslogix"].id

  private_service_connection {
    name                           = "psc-${each.key}"
    private_connection_resource_id = azurerm_storage_account.storage_account[each.key].id
    is_manual_connection           = false
    subresource_names              = ["file"]
  }

  tags     = local.tags
  provider = azurerm.avd
}

resource "azurerm_private_dns_a_record" "dns_record" {
  for_each = var.storage_account_map

  name                = each.key
  zone_name           = data.azurerm_private_dns_zone.existing_private_dns_file.name
  resource_group_name = data.azurerm_private_dns_zone.existing_private_dns_file.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.pe[each.key].private_service_connection[0].private_ip_address]

  depends_on = [azurerm_private_endpoint.pe]
  provider   = azurerm.connectivity
}
