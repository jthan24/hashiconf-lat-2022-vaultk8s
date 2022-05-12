# List, create, update, and delete key/value secrets at secret/
path "secret/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "secretos/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}