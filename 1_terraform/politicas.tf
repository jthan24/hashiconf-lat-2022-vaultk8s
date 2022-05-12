
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("politica-admin.hcl")
}


resource "vault_policy" "secret_policy" {
  name   = "secrets"
  policy = file("politica-secretos.hcl")
}