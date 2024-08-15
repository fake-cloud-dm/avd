resource "azurerm_network_interface" "nic" {
  count               = length(local.vm_details)
  name                = "${local.vm_details[0]["vmname"]}-nic"
  resource_group_name = azurerm_resource_group.rg_avd["gal"].name
  location            = azurerm_resource_group.rg_avd["gal"].location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_avd["avd"].id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.tags
}
resource "azurerm_windows_virtual_machine" "image_vm" {
  name                = local.vm_details[0]["vmname"]
  resource_group_name = azurerm_resource_group.rg_avd["gal"].name
  location            = azurerm_resource_group.rg_avd["gal"].location
  zone                = local.vm_details[0]["vmzone"]
  size                = local.vm_details[0]["vmsize"]

  identity {
    type = "SystemAssigned"
  }

  # Enabling Trusted Launch
  secure_boot_enabled = true

  vm_agent_platform_updates_enabled = true

  admin_username = "avd_local_admin"
  admin_password = random_password.avd_local_admin_secret_password.result

  network_interface_ids = [
    azurerm_network_interface.nic[0].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_id = azurerm_shared_image.image_definition["production"].id
  depends_on      = [null_resource.packer]

  tags = local.tags
}

resource "random_password" "avd_local_admin_secret_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azurerm_key_vault_secret" "kv_secret" {
  name         = "avd-vm-local-admin"
  value        = random_password.avd_local_admin_secret_password.result
  key_vault_id = data.azurerm_key_vault.mgmt_keyvault.id
}
