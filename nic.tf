resource "azurerm_network_interface" "learn_nic" {
    name                = "myNIC"
    location            = "${var.azure_location}"
    resource_group_name = "${var.azure_resourcegroup}"
    network_security_group_id = "${azurerm_network_security_group.learn_nsg.id}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${azurerm_subnet.learn_subnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.learn_publicip.id}"
    }
}