resource "azurerm_log_analytics_workspace" "devops-loganalytics" {
  name                = "devops-la-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "devops-appinsights" {
  name                = "devops-appinsights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.devops-loganalytics.id
  application_type    = "web"
  depends_on = [
    azurerm_log_analytics_workspace.devops-loganalytics
  ]
}

output "instrumentation_key" {
  value = azurerm_application_insights.devops-appinsights.instrumentation_key
  sensitive = true
}

output "app_id" {
  value = azurerm_application_insights.devops-appinsights.id
  sensitive = true
}