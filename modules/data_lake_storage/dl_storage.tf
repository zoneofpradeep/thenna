resource "azurerm_storage_account" "storage_account" {
  name                     = "${terraform.workspace}datalakestore"
  resource_group_name      = var.rg_name
  location                 = lookup(var.metadata, "location")
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  tags = {
    environment = "${terraform.workspace}"
  }
}