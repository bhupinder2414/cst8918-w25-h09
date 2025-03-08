terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d9e934e6-bf60-4a22-abae-d7f92d24e1c3"
}

resource "azurerm_resource_group" "app" {
  name     = "bhup0006-CST8918"
  location = "Central US"
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  dns_prefix          = "aks-cluster"

  default_node_pool {
    name       = "workernode"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.30.9"

  tags = {
    environment = "dev"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.app.kube_config_raw
  sensitive = true
}
