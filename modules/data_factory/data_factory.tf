resource "azurerm_data_factory" "df" {
  name                = "${terraform.workspace}-data-factory"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
}