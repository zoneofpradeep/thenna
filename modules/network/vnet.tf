resource "azurerm_virtual_network" "vnet" {
  name                = "${terraform.workspace}-vnet"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}



