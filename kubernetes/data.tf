## get secret data
data "kubernetes_secret_v1" "vault-auth-service-account-secret" {
  depends_on = [kubernetes_secret_v1.vault-auth-service-account-token]
  metadata {
    name      = "vault-auth-service-account-token-ckvbh"
    namespace = "vault"
  }
}
