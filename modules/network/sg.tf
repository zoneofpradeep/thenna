resource "azurerm_network_security_group" "nsg_1" {
  name                = "${terraform.workspace}-nsg_1"
  resource_group_name  = var.rg_name
  location            = lookup(var.metadata, "location")

  security_rule {
    name                       = "default"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
  subnet_id                 = azurerm_subnet.subnet_1.id
  network_security_group_id = azurerm_network_security_group.nsg_1.id
}

resource "azurerm_network_security_group" "nsg_db" {
  name                = "${terraform.workspace}-nsg_db"
  resource_group_name  = var.rg_name
  location            = lookup(var.metadata, "location")

  security_rule {
    name                       = "default"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "db_nsg_associate" {
  subnet_id                 = azurerm_subnet.postgres_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_db.id
}