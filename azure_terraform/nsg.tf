resource "azurerm_network_security_group" "learn_nsg" {
    location = "${var.azure_location}"
    name = "nwsg"
    resource_group_name  = "${var.azure_resourcegroup}"
    security_rule{
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}