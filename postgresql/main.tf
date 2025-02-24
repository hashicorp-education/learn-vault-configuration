# create ro role used in the databases secrets engine tutorial
resource "postgresql_role" "ro" {
  provider = postgresql
  name     = "ro"
  inherit = "false"
}

# Grant SELECT to ro on public
resource "postgresql_grant" "readonly_tables" {
  provider = postgresql
  database    = "postgres"
  role        = "ro" #postgresql_role.ro.name
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT"]
}