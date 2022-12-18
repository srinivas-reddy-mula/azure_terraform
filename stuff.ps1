
### powershell way to find and replace name of  terraform state file

#   get env name from terraform state file stored in azurerm backend
$backend_env = ((((((Get-Content .\backend.tf)[5]).Split("="))[1]).Split('"')).Split('.'))[1]

#   Get env name from terraform workspace
$workspace_env = Get-Content .\.terraform\environment

#   Command to rename the terraform state file
$find = "$backend_env.terraform.tfstate"
$replace = "$workspace_env.terraform.tfstate"
(Get-Content -Path .\backend.tf) -replace $find, $replace | Set-Content -Path .\backend.tf
# backend state filename changed accroding to terraform workspace name