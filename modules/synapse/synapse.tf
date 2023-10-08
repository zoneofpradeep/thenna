

resource "azurerm_synapse_workspace" "synapse" {
  name                                 = "${terraform.workspace}-synapse"
  resource_group_name                  = var.rg_name
  location                             = lookup(var.metadata, "location")
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.sa_filesystem.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "H@Sh1CoR3!"

  aad_admin {
    login     = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = "00000000-0000-0000-0000-000000000000"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Env = "${terraform.workspace}"
  }
}