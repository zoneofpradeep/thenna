resource "azurerm_container_registry" "acr" {
  name                = "${terraform.workspace}Registry1"
  resource_group_name = var.rg_name
  location            = lookup(var.metadata, "location")
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = lookup(var.metadata, "container_replication_1")
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = lookup(var.metadata, "container_replication_2")
    zone_redundancy_enabled = true
    tags                    = {}
  }
}