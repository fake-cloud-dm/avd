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
