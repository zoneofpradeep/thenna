# Generate random resource group name


# resource "random_pet" "azurerm_kubernetes_cluster_name" {
#   prefix = "cluster"
# }

# resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
#   prefix = "dns"
# }

# resource "azurerm_kubernetes_cluster" "k8s" {
#   location            = lookup(var.metadata, "location")
# #   name                = random_pet.azurerm_kubernetes_cluster_name.id
#   name                = "${terraform.workspace}-aks"
#   resource_group_name = var.rg_name
#   dns_prefix          = "${terraform.workspace}-aks-dns"
# #   dns_prefix          = random_pet.azurerm_kubernetes_cluster_dns_prefix.id

#   identity {
#     type = "SystemAssigned"
#   }

#   default_node_pool {
#     name       = "agentpool"
#     vm_size    = "Standard_D2_v2"
#     node_count = 1
#   }
#   linux_profile {
#     admin_username = "admin"

#     ssh_key {
#       key_data = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
#     }
#   }
#   network_profile {
#     network_plugin    = "kubenet"
#     load_balancer_sku = "standard"
#   }
# }

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${terraform.workspace}-aks"
  location            = lookup(var.metadata, "location")
  resource_group_name = var.rg_name
  dns_prefix          = "${terraform.workspace}-aks-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "${terraform.workspace}"
  }
}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.example.kube_config_raw

#   sensitive = true
# }