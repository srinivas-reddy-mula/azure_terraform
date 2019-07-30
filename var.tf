# az login
# az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
# az account show --query "{ subscription_id: id }"



variable "azure_subscriptionid" {
    type = "string"
    description = "your subscription id"
}
variable "azure_tenantid" {
    type = "string"
    description = "your tenant id"
}

variable "azure_clientid" {   
    type = "string"
    description = "your appid/client id"
}
variable "azure_clientsecret" {
    type = "string"
    description = "your password/client secret"
}

variable "azure_resourcegroup" {
    type = "string"
    description = "myresourcegroup"  
}
variable "azure_location" {
    type = "string"
    description = "Central US"  
}

