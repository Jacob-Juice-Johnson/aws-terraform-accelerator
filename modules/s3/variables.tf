variable "tags" {
  type        = map(any)
  description = "key value pairs for S3 bucket"
}

variable "name_prefix" {
  type        = string
  description = "S3 bucket name prefix"
}