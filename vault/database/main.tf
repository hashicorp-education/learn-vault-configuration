resource "vault_database_secrets_mount" "database" {
  path = "database"

  postgresql {
    name              = "postgres"
    username          = "root"
    password          = "rootpassword"
    connection_url    = "postgresql://{{username}}:{{password}}@${var.POSTGRES_URL}/postgres?sslmode=disable"
    verify_connection = true
    allowed_roles = [
      "readonly",
    ]
  }
}

resource "vault_database_secret_backend_role" "readonly" {
  name    = "readonly"
  backend = vault_database_secrets_mount.database.path
  db_name = "postgres"
  default_ttl = 3600
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}' INHERIT;",
    "GRANT ro TO \"{{name}}\";",
  ]
}