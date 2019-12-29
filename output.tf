output "resource_group_name" {
  value = var.create_resource_group ? azurerm_resource_group.rg[0].name : var.resource_group_name
}

output "resource_group_location" {
  value = var.create_resource_group ? azurerm_resource_group.rg[0].location : var.resource_group_location
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}
