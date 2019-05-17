resource "azurerm_public_ip" "learn_publicip" {
    name                         = "myPublicIP"
    location                     = "${var.azure_location}"
    resource_group_name          = "${var.azure_resourcegroup}"
    allocation_method            = "Dynamic"

}