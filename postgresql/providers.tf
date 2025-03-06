provider "postgresql" {
  # Configuration options
  scheme          = "postgres"
  host            = "localhost"
  port            = 5432
  database        = "postgres"
  username        = "root"
  password        = "rootpassword"
  sslmode         = "disable"
  connect_timeout = 15
}
