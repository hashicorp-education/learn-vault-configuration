## get secret data
data "kubernetes_secret_v1" "vault-auth-service-account-token" {
  depends_on = [kubernetes_secret_v1.vault-auth-service-account-token]
  metadata {
    name      = "vault-auth-service-account-token"
    namespace = "vault"
  }
}
