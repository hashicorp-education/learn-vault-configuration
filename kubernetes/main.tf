## create namespace
resource "kubernetes_namespace_v1" "vault" {
  metadata {
    name = "vault"
  }
}

## create service account
resource "kubernetes_service_account_v1" "vault-auth-service-account" {
  depends_on = [kubernetes_namespace_v1.vault]
  metadata {
    name = "vault-auth-service-account"
    namespace = "vault"
  }
}

## create service account token
resource "kubernetes_secret_v1" "vault-auth-service-account-token" {
  depends_on = [kubernetes_service_account_v1.vault-auth-service-account]
  metadata {
    namespace = "vault"
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.vault-auth-service-account.metadata.0.name
    }

    name = "vault-auth-service-account-token"
  }

  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}

## create cluster role binding for auth delegator
resource "kubernetes_cluster_role_binding_v1" "role-tokenreview-binding" {
  depends_on = [kubernetes_service_account_v1.vault-auth-service-account]
  metadata {
    name = "role-tokenreview-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "vault-auth-service-account"
    namespace = "vault"
  }
}
