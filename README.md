## Create vNet in Azure with (Optional) service endpoints

[![Build Status](https://dev.azure.com/jungodevops/Terraform/_apis/build/status/jungopro.terraform-azurerm-vnet?branchName=master)](https://dev.azure.com/jungodevops/Terraform/_build/latest?definitionId=28&branchName=master)

This Terraform module deploys a vNet to Azure.  
This module also has the option to create a Resource Group for the vNet, althought I recommend creating it manually since destruction of the Resource Group with `terraform destroy` can potientially cause destruction of other resources in the Resource Group beside the vNet

## Usage

```hcl
module "vnet" {
  source              = "jungopro/vnet/azurerm"

  tags = {
    environment = "dev"
  }
}
```

## Example with custom values

```hcl
module "vnet" {
  source              = "jungopro/vnet/azurerm"
  create_resource_group   = true
  resource_group_name     = "myCustomRG"
  resource_group_location = "westus"
  vnet_cidr               = ["10.0.0.0/8"]
  
  subnets = {
    be-subnet = {
      cidr              = "10.0.100.0/24",
      service_endpoints = ["Microsoft.KeyVault"]
    }
    fe-subnet = {
      cidr              = "10.0.200.0/24",
      service_endpoints = []
    }
  }

  tags = {
    environment = "dev"
  }
}
```