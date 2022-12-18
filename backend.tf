terraform {
  backend "azurerm" {
    resource_group_name  = "az500"
    storage_account_name = "tiacbackenderraform"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
