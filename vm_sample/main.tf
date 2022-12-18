# creating vnet in azure cloud

provider "azurerm" {
    subscription_id = "${var.azure_subscriptionid}"
    client_id       = "${var.azure_clientid}"
    client_secret   = "${var.azure_clientsecret}"
    tenant_id       = "${var.azure_tenantid}"
}
resource "azurerm_resource_group" "learn" {
    name = "${var.azure_resourcegroup}"
    location = "${var.azure_location}"


   
}









