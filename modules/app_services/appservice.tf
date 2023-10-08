resource "azurerm_app_service_plan" "as_plan" {
  name                = "${terraform.workspace}-appserviceplan"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "${terraform.workspace}-app-service"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.as_plan.id

  # site_config {
  #   dotnet_framework_version = "v4.0"
  #   scm_type                 = "LocalGit"
  # }

  # app_settings = {
  #   "SOME_KEY" = "some-value"
  # }

  # connection_string {
  #   name  = "Database"
  #   type  = "SQLServer"
  #   value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  # }
}