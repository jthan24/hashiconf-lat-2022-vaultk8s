resource "vault_auth_backend" "aws_auth" {
  type = "aws"
}

resource "vault_aws_auth_backend_client" "aws_client" {
  backend    = vault_auth_backend.aws_auth.path
  access_key = "INSERT_AWS_ACCESS_KEY"
  secret_key = "INSERT_AWS_SECRET_KEY"
}