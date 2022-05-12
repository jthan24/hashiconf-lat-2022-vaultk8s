resource "vault_auth_backend" "kubernetes_auth" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes_client" {
  backend                = vault_auth_backend.kubernetes_auth.path
  kubernetes_host        = "http://10.96.0.1:443"
  kubernetes_ca_cert     = file("kubernetes.crt")
  token_reviewer_jwt     = file("kubernetes.jwt")
  issuer                 = "https://kubernetes.default.svc.cluster.local"
  disable_iss_validation = "true"
}

resource "vault_policy" "kubernetes_secret_policy" {
  name   = "kubernetes-secrets"
  policy = file("kubernetes-politica.hcl")
}


resource "vault_kubernetes_auth_backend_role" "kubernetes_role" {
  backend                          = vault_auth_backend.kubernetes_auth.path
  role_name                        = "webapp"
  bound_service_account_names      = ["vault-auth"]
  bound_service_account_namespaces = ["hashi-vault"]
  token_ttl                        = 3600
  token_policies                   = ["kubernetes-secrets"]
}
