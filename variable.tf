variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "services_vault_name" {
  type        = string
  description = "name of the azurerm_recovery_services_vault"
}

variable "backup_policy_name" {
  type        = string
  description = "name of the azurerm_backup_policy_vm"
}

variable "vm_name" {
  type        = string
  description = "name of the azurerm_virtual_machine"
}