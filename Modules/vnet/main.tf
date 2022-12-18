data "azurerm_resource_group" "az500" {
    name = var.resource_group
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
  

  required_version = ">= 1.3.6"
}

/*locals {
    current_timestamp    = timestamp()
    current_time_india       = timeadd(local.current_timestamp, "5h30m")
    current_time_formatted = formatdate("YYYY_MM_DD_hh_mm_ss",local.current_time_india)
}*/

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.cidr_range]
  location            = data.azurerm_resource_group.az500.location
  resource_group_name = data.azurerm_resource_group.az500.name
}

resource "azurerm_subnet" "subnets" {
            count                = var.subnet_count
            name                 = format("subnet_%s_%s",count.index,formatdate("YYYY_MM_DD_hh_mm_ss",timeadd(timestamp(), "5h30m")))
            resource_group_name  = data.azurerm_resource_group.az500.name
            virtual_network_name = azurerm_virtual_network.vnet.name
            address_prefixes     = [cidrsubnet(var.cidr_range,8,count.index)]
}

