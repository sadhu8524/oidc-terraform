output "azure_client_id" {
  value       = azuread_application.github_oidc_app.application_id
  description = "Client ID for GitHub Secret: AZURE_CLIENT_ID"
}

output "azure_tenant_id" {
  value       = var.tenant_id
  description = "Tenant ID for GitHub Secret: AZURE_TENANT_ID"
}

output "azure_subscription_id" {
  value       = var.subscription_id
  description = "Subscription ID for GitHub Secret: AZURE_SUBSCRIPTION_ID"
}