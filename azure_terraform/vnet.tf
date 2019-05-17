resource "azurerm_virtual_network" "learn_net" {
    name = "vnet"
    location = "${azurerm_resource_group.learn.location}"
    address_space = ["10.0.0.0/16"]
    resource_group_name = "${azurerm_resource_group.learn.name}"
  
}