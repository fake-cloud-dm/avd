resource "null_resource" "packer" {
  depends_on = [
    azurerm_shared_image.image_definition
  ]
  triggers = {
    image_ver = var.sig_image_version
  }
  provisioner "local-exec" {
    command = "packer build -var sub=${var.avd_subscription_id} -var rg=${azurerm_resource_group.rg_avd["gal"].name} -var sig=${var.image_gallery_name} -var image_name=${var.shared_image_name} -var image_ver=${var.sig_image_version} -var rep_reg=${var.rep_reg} -var location=${var.location} -var imagesize=${var.imagesize} .\\packer\\packer_win11-23h2-avd-m365.json"
  }
}
