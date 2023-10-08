resource "azurerm_private_dns_zone" "db_dns" {
  name                = "${terraform.workspace}-pdz.postgres.database.azure.com"
  resource_group_name = var.rg_name

  depends_on = [azurerm_subnet_network_security_group_association.db_nsg_associate]
}

resource "azurerm_private_dns_zone_virtual_network_link" "db_link" {
  name                  = "${terraform.workspace}-pdzvnetlink.com"
  private_dns_zone_name = azurerm_private_dns_zone.db_dns.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  resource_group_name   = var.rg_name
}