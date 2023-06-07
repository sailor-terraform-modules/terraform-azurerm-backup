resource "azurerm_recovery_services_vault" "services_vault" {
  name                = var.services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_backup_policy_vm" "backup_policy" {
  name                = var.backup_policy_name
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.services_vault.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
}

data "azurerm_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.services_vault.name
  source_vm_id        = data.azurerm_virtual_machine.vm.id
  backup_policy_id    = azurerm_backup_policy_vm.backup_policy.id
}