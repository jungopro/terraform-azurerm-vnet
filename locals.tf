locals {
  resource_group = var.create_resource_group ? azurerm_resource_group.rg[0].name : var.resource_group_name
}