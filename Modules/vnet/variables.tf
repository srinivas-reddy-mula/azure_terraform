variable "resource_group" {
  type = string
  description = "resource group"
}

variable "vnet_name" {
  type = string
  description = "vnet_name"
}

variable "cidr_range" {
  type = string
  description = "vnet address prefix"
}

variable "subnet_count" {
  type = number
  description = "Number of subnets to be created"
}

