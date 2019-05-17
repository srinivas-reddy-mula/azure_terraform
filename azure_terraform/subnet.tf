resource "azurerm_subnet" "learn_subnet" {
    name                 = "subnet1"
    resource_group_name  = "${var.azure_resourcegroup}"
    virtual_network_name = "${azurerm_virtual_network.learn_net.name}"
    address_prefix       = "10.0.1.0/24"

}