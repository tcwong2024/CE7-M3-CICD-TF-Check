variable "bucket_name" {
  description = "bucket_name"
  type        = string
  default     = "wtc-tf-ci-bucket-20241030"
}

variable "target_bucket" {
  description = "Target bucket logging"
  type        = string
  default     = "wtc-logging-bucket-20241030"
}

variable "target_prefix" {
  description = "Target prefix logging"
  type        = string
  default     = "wtc-logs/"
}
