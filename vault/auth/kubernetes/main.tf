resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "example" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = "${var.K8S_URL}"
  kubernetes_ca_cert     = "${var.K8S_CA_CRT}"
  token_reviewer_jwt     = "${var.K8S_VAULTSA_TOKEN}"
  disable_iss_validation = "true"
}
