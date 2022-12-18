provider "azurerm" {
  location = "centralUS"
}

variable "cidr_block" {
  default = "192.168.0.0/16"
}

output "cidr1" {
  value = [for index in range(256) :
  cidrsubnet(var.cidr_block, 8, index)]
}

/*output "cidr2" {
  value = [for index in range(255) :
  cidrsubnet(var.cidr_block, 16, index)]
}*/

/*output "all_cidrs" {
  value = [for index1 in range(8) :
    {
      cidrsubnet(var.cidr_block, 8, index1) = [
        for index2 in range(8) : cidrsubnet(cidrsubnet(var.cidr_block, 8, index1), 5, index2)
      ]
    }
  ]
}
*/