$backend_env = ((((((Get-Content .\backend.tf)[5]).Split("="))[1]).Split('"')).Split('.'))[1]
$workspace_env = Get-Content .\.terraform\environment
$find = "$backend_env.terraform.tfstate"
$replace = "$workspace_env.terraform.tfstate"
(Get-Content -Path .\backend.tf) -replace $find, $replace | Set-Content -Path .\backend.tf