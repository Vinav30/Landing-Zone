terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.74.0"
    }
  }



 backend "azurerm" {
resource_group_name  = "vinavstg"
storage_account_name = "vinavstg"
 container_name       = "vinavci"
key                  = "vinav.tf"
 }

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

}
