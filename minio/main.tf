resource "minio_s3_bucket" "dev_bucket" {
  bucket = "dev-bucket"
  acl    = "public"
}

resource "minio_iam_user" "danielle" {
   name = "danielle"
   force_destroy = true
}