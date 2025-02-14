resource "vault_mount" "kvv1" {
  path        = "kvv1"
  type        = "kv"
  options     = { version = "1" }
  description = "KV Version 1 secret engine mount"
}

resource "vault_kv_secret" "api_key" {
  path        = "${vault_mount.kvv1.path/developer}"
  data_json   = jsonencode(
  {
    api_key = "1234567890"
  }
  )
}