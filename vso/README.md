Requires variable set for Vault container address.

**Example:**

`TF_VAR_K8S_TO_VAULT=$(minikube ssh "dig +short host.docker.internal" | tr -d '\r')`
