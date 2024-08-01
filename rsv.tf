##### RECOVERY SERVICES VAULT AND BACKUP POLICY #####
resource "azurerm_recovery_services_vault" "main" {
  name                = "rsv-avd-prod-uksouth-001"
  resource_group_name = azurerm_resource_group.rg_avd["avd"].name
  location            = azurerm_resource_group.rg_avd["avd"].location
  sku                 = "Standard"

  tags = local.tags
}

resource "azurerm_backup_policy_vm" "main" {
  name                = "rsvp-avd-prod-uksouth-001"
  resource_group_name = azurerm_resource_group.rg_avd["avd"].name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  timezone = "GMT Standard Time"

  backup {
    frequency = "Daily"
    time      = "00:00"
  }
  retention_daily {
    count = 30
  }
}
