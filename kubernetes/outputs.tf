## output the encoded secret data
output "encoded_secret_data" {
  value     = data.kubernetes_secret_v1.vault-auth-service-account-secret
  sensitive = true
}
