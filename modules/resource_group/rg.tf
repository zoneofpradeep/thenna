resource "azurerm_resource_group" "rg" {
  name     = "${terraform.workspace}-resource_group"
  location = lookup(var.metadata, "location")
}