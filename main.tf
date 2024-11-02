terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "ravitfcloudlab"

    workspaces {
      name = "Handsonlab_TF"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "28e1e42a-4438-4c30-9a5f-7d7b488fd883"

}

resource "azurerm_resource_group" "rg" {
  name     = "813-a97b150f-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "securestorage1" {
  source               = "app.terraform.io/ravitfcloudlab/securestorage1/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "mytflab00183"
}
