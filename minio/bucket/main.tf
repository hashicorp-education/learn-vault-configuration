resource "minio_s3_bucket" "dev_bucket" {
  bucket = "dev-bucket"
  acl    = "public"
}