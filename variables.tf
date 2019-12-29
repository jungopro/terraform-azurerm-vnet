variable "create_resource_group" {
  description = "Option to create a Azure resource group to use for VNET"
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created"
  default = "myRG"
}

variable "resource_group_location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created"
  default = "westeurope"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "vnet_cidr" {
  description = "The CIDR block for VNET"
  type        = list
  default     = ["172.16.0.0/16"]
}

variable "vnet_name" {
  description = "Name of the VNET"
  type        = string
  default     = "myVNET"
}

variable "vnet_dns_servers" {
  description = "Optional dns servers to use for VNET"
  type        = list
  default     = []
}

variable "subnets" {
  description = "Map of subnet objects. name, cidr, and service_endpoints supported"
  type = map(object({
    cidr              = string
    service_endpoints = list(string)
  }))
  default = {
    be-subnet = {
      cidr              = "172.16.0.0/22",
      service_endpoints = ["Microsoft.KeyVault"]
    }
    fe-subnet = {
      cidr              = "172.16.8.0/22",
      service_endpoints = []
    }
  }
}