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

output "subnet_name_to_id" {
  value = {
    for subnet in azurerm_subnet.subnet:
    subnet.name => subnet.id
  }
}

output "subnets_full_info" {
  value = azurerm_subnet.subnet
}

output "subnets_ids_list" {
  value = values(azurerm_subnet.subnet).*.id
}

output "subnets_ids" {
  value = [for index, value in azurerm_subnet.subnet : value.id]
}
