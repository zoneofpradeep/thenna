resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "${terraform.workspace}-postgress-server"
  resource_group_name    = var.rg_name
  location               = lookup(var.metadata, "location")
  version                = "13"
  delegated_subnet_id    = var.db_subnet
  private_dns_zone_id    = var.dns_zone
  administrator_login    = lookup(var.metadata, "db_user")
  administrator_password = lookup(var.metadata, "db_user_pwd")
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "GP_Standard_D2s_v3"
  backup_retention_days  = 7

  # depends_on = [var.db_link]
}

