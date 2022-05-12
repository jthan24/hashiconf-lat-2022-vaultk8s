resource "vault_auth_backend" "azure_auth" {
  type = "azure"
}

resource "vault_azure_auth_backend_config" "azure_client" {
  backend       = vault_auth_backend.azure_auth.path
  tenant_id     = "11111111-2222-3333-4444-555555555555"
  client_id     = "11111111-2222-3333-4444-555555555555"
  client_secret = "01234567890123456789"
  resource      = "https://vault.hashicorp.com"
}