variable "storage_account_name" {
  type    = string
  default = ""
}
variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

# variable "locations" {
#   description = "Primary and secondary Azure regions"
#   type = object({
#     primary   = string
#     secondary = string
#   })
#   default = {
#     primary   = "UK South"
#     secondary = "UK West"
#   }
# }

variable "dns_zone_resource_group_name" {
  description = "The resource group name for the Private Link DNS zones"
  type        = string
}

variable "location_short" {
  type    = string
  default = ""
}

variable "hub_subscription_id" {
  type    = string
  default = ""
}

variable "id_subscription_id" {
  type    = string
  default = ""
}

variable "mgmt_subscription_id" {
  type    = string
  default = ""
}

variable "prod_subscription_id" {
  type    = string
  default = ""
}

variable "avd_subscription_id" {
  type    = string
  default = ""
}

variable "existing_keyvault_name" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

variable "customer_name" {
  type    = string
  default = ""
}

variable "dns_servers" {
  type = list(string)
}

variable "org_short" {
  type    = string
  default = ""
}

variable "dns_ip" {
  type    = string
  default = ""
}

variable "org" {
  type    = string
  default = ""
}

variable "criticality" {
  type    = string
  default = ""
}

variable "application" {
  type    = string
  default = ""
}

variable "subscription_id" {
  type    = string
  default = ""
}

variable "firewall_ip" {
  type    = string
  default = ""
}

variable "storage_account_map" {
  type = map(any)
}

variable "avail_set_map" {
  type = map(any)
}

variable "vnet_map" {
  type = map(any)
}

variable "subnet_map" {
  type = map(any)
}

variable "resource_group_map" {
  type = map(any)
}

variable "environment_short" {
  type        = string
  description = "The Short Environment of the Resource Group."
}

variable "environment" {
  type        = string
  description = "The Environment of the Resource Group."
}

variable "image_definitions" {
  type = map(object({
    name      = string
    publisher = string
    offer     = string
    sku       = string
  }))
}

variable "hostpool_details" {
  type = map(object({
    name                     = string
    friendly_name            = string
    validate_environment     = bool
    start_vm_on_connect      = bool
    preferred_app_group_type = string
    type                     = string
    maximum_sessions_allowed = number
    load_balancer_type       = string
    custom_rdp_properties    = string
    workspace_name           = string
    application_group_name   = string
    application_group_type   = string
  }))
}

#FSLogix Stoage Variables
variable "fslogixshare" {
  description = "FSLogix share Name"
  type        = string
  default     = null
}
variable "fslogixstorage" {
  description = "FSLogix storage account name"
  type        = string
  default     = null
}

#Shared Image Gallery Variables
variable "image_gallery_name" {
  description = "Image Gallery Name"
  type        = string
  default     = null
}
variable "shared_image_name" {
  description = "Shared Image Name"
  type        = string
  default     = null
}
variable "sig_image_version" {
  description = "Image version"
  type        = string
  default     = null
}
variable "rep_reg" {
  description = "Image replication region"
  type        = string
  default     = null
}
variable "imagesize" {
  description = "Image size - used by Packer."
  type        = string
  default     = null
}


#Other Variables
variable "vm_size" {
  description = "Specifies the size of the virtual machine."
}

variable "image_publisher" {
  description = "Image Publisher"
}

variable "image_offer" {
  description = "Image Offer"
}

variable "image_sku" {
  description = "Image SKU"
}

variable "image_version" {
  description = "Image Version"
}

variable "admin_username" {
  description = "Local Admin Username"
}

variable "admin_password" {
  description = "Admin Password"
}

variable "subnet_id" {
  description = "Azure Subnet ID"
}

variable "vm_name" {
  description = "Virtual Machine Name"
}

variable "vm_count" {
  description = "Number of Session Host VMs to create"
}

variable "domain" {
  description = "Domain to join"
}

variable "domainuser" {
  description = "Domain Join User Name"
}

variable "oupath" {
  description = "OU Path"
}

variable "domainpassword" {
  description = "Domain User Password"
}

variable "artifactslocation" {
  description = "Location of WVD Artifacts"
  default     = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration.zip"
}
