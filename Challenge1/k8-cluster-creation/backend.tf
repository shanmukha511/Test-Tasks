terraform {
  backend "azurerm" {
    subscription_id      = "*********************"
    container_name       = "**********"
    storage_account_name = "*********"
    resource_group_name  = "********"
    key                  = "terraform.tfstate"
  }
}