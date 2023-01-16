resource "aws_s3_bucket" "this" {
  bucket = "${var.name_prefix}-bucket"
  tags   = var.tags
}