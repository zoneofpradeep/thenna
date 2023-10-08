resource "azurerm_api_management" "management" {
  name                = "${terraform.workspace}-apim"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
  publisher_name      = "Test_Name"
  publisher_email     = "test@terraform.io"

  sku_name = "Developer_1"
}

resource "azurerm_api_management_api" "api" {
  name                = "${terraform.workspace}-api"
  resource_group_name = var.rg_name
  api_management_name = azurerm_api_management.management.name
  revision            = "1"
  display_name        = "${terraform.workspace} API"
  path                = "test"
  protocols           = ["https"]

  import {
    content_format = "swagger-link-json"
    content_value  = "http://conferenceapi.azurewebsites.net/?format=json"
  }
}