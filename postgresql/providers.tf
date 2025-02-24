provider "postgresql" {
  # Configuration options
  scheme          = "postgresql"
  host            = "localhost"
  port            = 5432
  database        = "postgres"
  username        = "root"
  password        = "rootpassword"
  sslmode         = "disable"
  connect_timeout = 15
}