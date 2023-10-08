
module "resource_group" {
  source = "./modules/resource_group"
  metadata = lookup(local.env, (terraform.workspace))
}

module "network" {
  source = "./modules/network"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}

module "aks" {
  source = "./modules/aks"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}

module "apim" {
  source = "./modules/apim"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}

module "app_services" {
  source = "./modules/app_services"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}

module "container_registry" {
  source = "./modules/container_registry"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}
module "data_factory" {
  source = "./modules/data_factory"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}
module "data_lake_storage" {
  source = "./modules/data_lake_storage"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}
module "keyvault" {
  source = "./modules/keyvault"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
}
module "postgresql" {
  source = "./modules/postgresql"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
  db_subnet = module.network.subnet_db
  vnet_id = module.network.vnet_id
  dns_zone = module.network.dns_zone
  db_link = module.network.db_link
  depends_on = [ module.network ]
}
module "synapse" {
  source = "./modules/synapse"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
  storage_acc_id = module.data_lake_storage.storage_acc_id
}
module "machine_learning" {
  source = "./modules/machine_learning"
  metadata = lookup(local.env, (terraform.workspace))
  rg_name = module.resource_group.rg_name
  rg_id = module.resource_group.rg_id
  storage_acc_id = module.data_lake_storage.storage_acc_id
  keyvault_id = module.keyvault.keyvault_id
  subnet_1 = module.network.subnet_1
}
