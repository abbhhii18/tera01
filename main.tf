provider "azurerm" {
  features {}
  subscription_id = "5ae490de-9605-4b0d-93b1-b77922d27118"
  skip_provider_registration = true
}

resource "azurerm_resource_group" "DevopsGrp" {
  name     = "DevOpsGrp"
  location = "East US"
}

resource "azurerm_container_group" "ContainerGrp" {
  name                = "ContainerGrp"
  location            = "East US"
  resource_group_name = azurerm_resource_group.DevopsGrp
  ip_address_type     = "Public"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "abhi2322/projectt:225"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}