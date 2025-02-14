# Enable the userpass authentication method
resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

# Create a user with a password and policy
resource "vault_generic_endpoint" "danielle" {
  path   = "auth/userpass/users/danielle"
  data_json = jsonencode({
    password = "mypassword" 
    policies = ["default"]    # Create and attach policies in other modules as needed
  })
}