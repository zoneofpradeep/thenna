output "vnet_id" {
    value = azurerm_virtual_network.vnet.id
}
output "subnet_1" {
    value = azurerm_subnet.subnet_1.id
}
output "subnet_db" {
    value = azurerm_subnet.postgres_subnet.id
}
output "dns_zone" {
    value = azurerm_private_dns_zone.db_dns.id
}
output "db_link" {
    value = azurerm_private_dns_zone_virtual_network_link.db_link
}

