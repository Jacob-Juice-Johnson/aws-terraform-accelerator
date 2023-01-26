variable "tags" {
  type        = map(any)
  description = "key value pairs for resources created via terraform"
}

variable "test_var_inject" {
  type        = bool
  description = "Test var inject conecept"
  default     = false
}