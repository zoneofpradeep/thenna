data "azurerm_client_config" "current" {}


resource "azurerm_application_insights" "app_insights" {
  name                = "${terraform.workspace}-ai"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
  application_type    = "web"
}


resource "azurerm_machine_learning_workspace" "mlw" {
  name                    = "${terraform.workspace}-mlw"
  location                 = lookup(var.metadata, "location")
  resource_group_name      = var.rg_name
  application_insights_id = azurerm_application_insights.app_insights.id
  key_vault_id            = var.keyvault_id
  storage_account_id      = var.storage_acc_id
  identity {
    type = "SystemAssigned"
  }
}


variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqaZoyiz1qbdOQ8xEf6uEu1cCwYowo5FHtsBhqLoDnnp7KUTEBN+L2NxRIfQ781rxV6Iq5jSav6b2Q8z5KiseOlvKA/RF2wqU0UPYqQviQhLmW6THTpmrv/YkUCuzxDpsH7DUDhZcwySLKVVe0Qm3+5N2Ta6UYH3lsDf9R9wTP2K/+vAnflKebuypNlmocIvakFWoZda18FOmsOoIVXQ8HWFNCuw9ZCunMSN62QGamCe3dL5cXlkgHYv7ekJE15IA9aOJcM7e90oeTqo+7HTcWfdu0qQqPWY5ujyMw/llas8tsXY85LFqRnr3gJ02bAscjc477+X+j/gkpFoN1QEmt terraform@demo.tld"
}

resource "azurerm_machine_learning_compute_instance" "ml_instance" {
  name                          = "${terraform.workspace}-instance"
  location                      = lookup(var.metadata, "location")
  machine_learning_workspace_id = azurerm_machine_learning_workspace.mlw.id
  virtual_machine_size          = "STANDARD_DS2_V2"
  authorization_type            = "personal"
  ssh {
    public_key = var.ssh_key
  }
  subnet_resource_id = var.subnet_1
  description        = "foo"
  tags = {
    foo = "bar"
  }
}