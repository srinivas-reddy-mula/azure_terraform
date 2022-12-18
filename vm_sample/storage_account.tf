resource "random_id" "learn_randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = "${var.azure_resourcegroup}"
    }
    
    byte_length = 8
}

resource "azurerm_storage_account" "learn_mystorageaccount" {
    name                = "diag${random_id.learn_randomId.hex}"
    resource_group_name = "${var.azure_resourcegroup}"
    location            = "${var.azure_location}"
    account_replication_type = "LRS"
    account_tier = "Standard"

}
