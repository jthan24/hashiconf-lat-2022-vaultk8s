resource "vault_gcp_auth_backend" "gcp_client" {
  credentials = file("vault-gcp-credentials.json")
}