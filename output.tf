output "resource_group_id" {
  value = azurerm_resource_group.example.id
}

output "nsg_id" {
  value = azurerm_network_security_group.example.id
}
