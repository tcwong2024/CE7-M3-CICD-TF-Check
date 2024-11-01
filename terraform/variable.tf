variable "region_name" {
  description = "region name"
  type        = string
  default     = "us-east-1"
}

# ------------------------------------------------------------
# Variable for S3 bucket
# ------------------------------------------------------------

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

# ------------------------------------------------------------
# Variable for EC2 
# ------------------------------------------------------------

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

# variable.tf:39:1: Warning - variable "key_name" is declared but not used (terraform_unused_declarations)
# variable "key_name" {
#   description = "EC2 Key Pair pair"
#   type        = string
#   default     = "wtc-keypair-useast1"
# }

variable "ec2_name" {
  description = "EC2 name"
  type        = string
  default     = "wtc-tf-ec2"
}

variable "securityGrp_name" {
  description = "securiry group name"
  type        = string
  default     = "wtc-tf-sg-allow-ssh-http-https"
}
