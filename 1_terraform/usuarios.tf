## Habilitar un usuario

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}


resource "vault_generic_endpoint" "administrador" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/admin"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["admins"],
  "password": "admin1234"
}
EOT
}



resource "vault_generic_endpoint" "secretos" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/secretos"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["secrets"],
  "password": "secretos1234"
}
EOT
}