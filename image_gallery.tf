resource "azurerm_shared_image_gallery" "gallery" {
  name                = var.image_gallery_name
  resource_group_name = azurerm_resource_group.rg_avd["gal"].name
  location            = azurerm_resource_group.rg_avd["gal"].location
  description         = "Shared Images"

  provider = azurerm.avd

  tags = local.tags
}

resource "azurerm_shared_image" "image_definition" {
  for_each = var.image_definitions

  name         = each.value.name
  gallery_name = azurerm_shared_image_gallery.gallery.name

  os_type                = "Windows"
  hyper_v_generation     = "V2"
  trusted_launch_enabled = true

  identifier {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
  }

  resource_group_name = azurerm_resource_group.rg_avd["gal"].name
  location            = azurerm_resource_group.rg_avd["gal"].location
  tags                = local.tags

  provider = azurerm.avd
}
