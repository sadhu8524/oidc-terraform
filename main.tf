provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

data "azurerm_client_config" "current" {}

resource "azuread_application" "github_oidc_app" {
  display_name = "GitHub-OIDC-App"
}

resource "azuread_service_principal" "github_oidc_sp" {
  application_id = azuread_application.github_oidc_app.application_id
}

resource "azurerm_role_assignment" "app_contributor" {
  scope                = "/subscriptions/${var.subscription_id}"
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.github_oidc_sp.object_id
}

resource "azuread_application_federated_identity_credential" "github_oidc" {
  application_object_id = azuread_application.github_oidc_app.object_id
  display_name          = "github-actions-oidc"
  description           = "OIDC federated identity for GitHub Actions"
  audiences             = ["api://AzureADTokenExchange"]

  issuer  = "https://token.actions.githubusercontent.com"
  subject = "repo:${var.github_owner}/${var.github_repo}:ref:refs/heads/${var.github_branch}"
}