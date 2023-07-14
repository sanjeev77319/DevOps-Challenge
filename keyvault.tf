data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "devops-keyvault" {
  name                        = "devopskeyvault2024"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"


}

resource "azurerm_key_vault_access_policy" "kv_access_policy_01" {
  #This policy adds databaseadmin group with below permissions
  key_vault_id       = azurerm_key_vault.devops-keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "3b1567fe-6a85-46b9-86e3-9c23c12be21d"
  key_permissions    = ["Get", "List"]
  secret_permissions = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]

  depends_on = [azurerm_key_vault.devops-keyvault]
}

resource "azurerm_key_vault_access_policy" "kv_access_policy_02" {
  #This policy adds databaseadmin group with below permissions
  key_vault_id       = azurerm_key_vault.devops-keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "3b1567fe-6a85-46b9-86e3-9c23c12be21d"
  key_permissions    = ["Get", "List"]
  secret_permissions = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]

  depends_on = [azurerm_key_vault.devops-keyvault]
}


resource "azurerm_key_vault_access_policy" "kv_access_policy_03" {
  #This policy adds databaseadmin group with below permissions
  key_vault_id       = azurerm_key_vault.devops-keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "3b1567fe-6a85-46b9-86e3-9c23c12be21d"
  key_permissions    = ["Get", "List"]
  secret_permissions = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]

  depends_on = [azurerm_key_vault.devops-keyvault]
}