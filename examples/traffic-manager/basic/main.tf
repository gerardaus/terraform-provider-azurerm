resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_traffic_manager_profile" "example" {
  name                   = "${var.prefix}-trafficmanager"
  resource_group_name    = "${azurerm_resource_group.example.name}"
  traffic_routing_method = "Weighted"

  dns_config {
    relative_name = "${azurerm_resource_group.example.name}"
    ttl           = 30
  }

  monitor_config {
    protocol = "http"
    port     = 80
    path     = "/"
  }
}
