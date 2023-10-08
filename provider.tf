terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id   = "b59fdcc1-2fe6-4290-ab7d-f659a30bad5b"
}

provider "azuread" {

  # NOTE: Environment Variables can also be used for Service Principal authentication

  # client_id     = "..."
  # client_secret = "..."
  # tenant_id     = "..."
}