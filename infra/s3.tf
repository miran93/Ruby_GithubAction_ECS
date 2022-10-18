resource "aws_s3_bucket" "data-bucket" {
  bucket = var.bucket_name
  acl    = "private"
}