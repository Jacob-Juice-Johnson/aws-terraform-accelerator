resource "aws_s3_bucket" "this" {
  bucket = "${var.name_prefix}-s3-bucket"
  tags   = var.tags
}