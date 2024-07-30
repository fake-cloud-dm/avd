resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_account_map

  name                          = lower("${each.key}")
  resource_group_name           = azurerm_resource_group.rg_avd["fslogix"].name
  location                      = each.value.location
  account_kind                  = each.value.account_kind
  account_tier                  = each.value.account_tier
  account_replication_type      = each.value.account_replication_type
  public_network_access_enabled = each.value.public == "true"
  tags                          = local.tags
  provider                      = azurerm.production
}

resource "azurerm_storage_container" "storage_container" {
  for_each = var.storage_account_map

  name                  = each.value.container
  storage_account_name  = azurerm_storage_account.storage_account[each.key].name
  container_access_type = "private"
  provider              = azurerm.production
}

