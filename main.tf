terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
  

  required_version = ">= 1.3.6"
}


data "azurerm_resource_group" "az500" {
    name = var.resource_group
}

module "vnet1" {
    source = "./Modules/vnet"
    resource_group = var.resource_group
    vnet_name = var.vnet_name
    cidr_range = var.cidr_range
    subnet_count = var.subnet_count
}
module "vnet2" {
  source = "./Modules/vnet"
  resource_group = var.resource_group
  vnet_name = "vnet2"
  cidr_range = "192.169.0.0/16"
  subnet_count = var.subnet_count
}