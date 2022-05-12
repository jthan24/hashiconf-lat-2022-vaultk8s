
resource "vault_mount" "secretos" {
  path        = "secretos"
  type        = "kv-v2"
  description = "Base para los secretos"
}


resource "vault_generic_secret" "secreto_basedatos" {
  depends_on = [vault_mount.secretos]
  path       = "secretos/basedatos"

  data_json = <<EOT
{
  "user":   "usuariobd",
  "password": "lacontrasenia"
}
EOT
}


