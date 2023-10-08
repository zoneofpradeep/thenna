locals {
  env = {
    "dev" = {
        location = "West Europe"
        container_replication_1 = "East US"
        container_replication_2 = "North Europe"
        db_user = "tfadmin"
        db_user_pwd = "test1234"
    }
    "pre-prod" = {
        location = "West Europe"
        container_replication_1 = "East US"
        container_replication_2 = "North Europe"
        db_user = "tfadmin"
        db_user_pwd = "test1234"
    }
    "prod" = {
        location = "West Europe"
        container_replication_1 = "East US"
        container_replication_2 = "North Europe"
        db_user = "tfadmin"
        db_user_pwd = "test1234"
    }
  }
}