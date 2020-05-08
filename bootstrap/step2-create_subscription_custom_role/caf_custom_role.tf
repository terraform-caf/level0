

resource "azurerm_role_definition" "bootstrap_owner" {
  name        = "caf-boostrap_owner"
  scope       = data.azurerm_subscription.primary.id
  description = "Provide a least privilege role to the caf boostrap Azure AD application"

  permissions {
    actions     = [
      "Microsoft.Authorization/roleAssignments/delete",
      "Microsoft.Authorization/roleAssignments/read",
      "Microsoft.Authorization/roleAssignments/write",
      "microsoft.insights/diagnosticSettings/delete",
      "microsoft.insights/diagnosticSettings/read",
      "microsoft.insights/diagnosticSettings/write",
      "Microsoft.KeyVault/vaults/delete",
      "Microsoft.KeyVault/vaults/read",
      "Microsoft.KeyVault/vaults/write",
      "Microsoft.KeyVault/vaults/accessPolicies/write",
      "Microsoft.Network/networkSecurityGroups/delete",
      "Microsoft.Network/networkSecurityGroups/read",
      "Microsoft.Network/networkSecurityGroups/write",
      "Microsoft.Network/networkSecurityGroups/join/action",
      "Microsoft.Network/virtualNetworks/subnets/delete",
      "Microsoft.Network/virtualNetworks/subnets/read",
      "Microsoft.Network/virtualNetworks/subnets/write",
      "Microsoft.OperationalInsights/workspaces/delete",
      "Microsoft.OperationalInsights/workspaces/read",
      "Microsoft.OperationalInsights/workspaces/write",
      "Microsoft.OperationalInsights/workspaces/sharedKeys/action",
      "Microsoft.OperationsManagement/solutions/delete",
      "Microsoft.OperationsManagement/solutions/read",
      "Microsoft.OperationsManagement/solutions/write",
      "Microsoft.Storage/storageAccounts/delete",
      "Microsoft.Storage/storageAccounts/read",
      "Microsoft.Storage/storageAccounts/write",
      "Microsoft.Storage/storageAccounts/blobServices/containers/delete",
      "Microsoft.Storage/storageAccounts/blobServices/containers/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/write",
      "Microsoft.Storage/storageAccounts/blobServices/containers/lease/action"
      "Microsoft.Storage/storageAccounts/blobServices/read",
      "Microsoft.Storage/storageAccounts/listKeys/action",
      "Microsoft.Resources/subscriptions/write",
      "Microsoft.Resources/subscriptions/providers/read",
      "Microsoft.Resources/subscriptions/read",
      "Microsoft.Resources/subscriptions/resourcegroups/delete",
      "Microsoft.Resources/subscriptions/resourcegroups/read",
      "Microsoft.Resources/subscriptions/resourcegroups/write",
      "Microsoft.Network/virtualNetworks/delete",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Network/virtualNetworks/write",
    ]
    not_actions = []
    dataActions = [
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/write",
      "Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read"
    ]
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}

resource "azurerm_role_assignment" "bootstrap_owner" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_id   = azurerm_role_definition.bootstrap.id
  principal_id         = data.terraform_remote_state.step1.outputs.bootstrap_service_principal_object_id
}