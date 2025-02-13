resource "vault_mount" "kvv2" {
  path        = "kvv2"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "api_key" {
  mount                      = vault_mount.kvv2.path
  name                       = "developer"
  cas                        = 1
  delete_all_versions        = true
  data_json                  = jsonencode(
  {
    api_key = "1234567890"
  }
  )
  custom_metadata {
    max_versions = 5
  }
}