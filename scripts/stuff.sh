#!/bin/bash

#   Get workspace environment name to change terraform state file name 
workspace_env=`cat .terraform/environment`
#   Get environment name from backend configuration
backend_env=`cat backend.tf | grep "terraform.tfstate" | awk -F\" '{print $2}' | awk -F\. '{print $1}'`

#   Change backend file name with workspace_env name
sed "s/dev.terraform.tfstate/$workspace_env.terraform.tfstate/" backend.tf
# backend state filename changed accroding to terraform workspace name
