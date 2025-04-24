resource "kubernetes_manifest" "vault_connection" {
  manifest = {
    "apiVersion" = "secrets.hashicorp.com/v1beta1"
    "kind"       = "VaultConnection"
    "metadata" = {
      "name"      = "vault-connection"
      "namespace" = "vault"
    }
    "spec" = {
      "address" = "http://${var.K8S_TO_VAULT}:8200"
    }
  }
}
