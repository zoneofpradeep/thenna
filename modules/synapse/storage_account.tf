
# resource "azurerm_storage_account" "storage_account" {
#   name                     = "${terraform.workspace}storageacc"
#   resource_group_name      = var.rg_name
#   location                 = lookup(var.metadata, "location")
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind             = "StorageV2"
#   is_hns_enabled           = "true"
# }

resource "azurerm_storage_data_lake_gen2_filesystem" "sa_filesystem" {
  name               = "${terraform.workspace}"
  storage_account_id = var.storage_acc_id
}