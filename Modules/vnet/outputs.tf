output "subnet_cidrs" {
  value = [for index in range(var.subnet_count) : format("subnet_%s",index)]
}

output "subnet_cidr_space" {
  value = [for index in range(var.subnet_count) : cidrsubnet(var.cidr_range,8,index)]
}



output "subnet_info" {
  value = {for index1 in range(var.subnet_count) : format("subnet_%s",index1) => cidrsubnet(var.cidr_range,8,index1)}
}

output "VNET" {
  value = format("vnet name: %s \n vnet id %s",azurerm_virtual_network.vnet.name, azurerm_virtual_network.vnet.id)
}
