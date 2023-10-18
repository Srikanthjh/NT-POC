provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
  backend "azurerm" {
    key              = "terraform.tfstate"
    use_oidc         = true
    use_azuread_auth = true
    storage_account_name = "testtfstateoidc"
    resource_group_name = "free-res"
    container_name = "tfstate"
    client_id = "8a273953-5184-4899-9410-d01680b15150"
    tenant_id = "44f956ed-ca61-4b64-b36e-4ad00d218ed1"
    subscription_id = "429ab725-ab09-4085-8ed9-1db644407c13"

  }
