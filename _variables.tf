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

variable "dev_subscription_id" {
  type    = string
  default = ""
}

variable "uat_subscription_id" {
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
