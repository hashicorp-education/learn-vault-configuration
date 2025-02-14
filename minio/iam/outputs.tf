output "secret" {
  value = "${minio_iam_user.danielle.secret}"
  sensitive = true
}