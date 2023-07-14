# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "tfstatestorageaccount77"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "Devopschallenge-rg"
  location = var.location-rg
  tags = {
    "Application" = "DevOpschallenge"
  }
}

