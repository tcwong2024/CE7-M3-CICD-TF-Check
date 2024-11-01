resource "aws_s3_bucket" "simple-bucket" {
  bucket = var.bucket_name

  # Disabled S3 server access logging - Snyk recommended
  logging {
    target_bucket = var.target_bucket
    target_prefix = var.target_prefix
  }

  #checkov:skip=CKV_AWS_18:Ensure the S3 bucket has access logging enabled
  #checkov:skip=CKV2_AWS_61:Ensure that an S3 bucket has a lifecycle configuration
  #checkov:skip=CKV2_AWS_62:Ensure S3 buckets should have event notifications enabled
  #checkov:skip=CKV_AWS_145:Ensure that S3 buckets are encrypted with KMS by default
  #checkov:skip=CKV2_AWS_6:Ensure that S3 bucket has a Public Access block
  #checkov:skip=CKV_AWS_144:Ensure that S3 bucket has cross-region replication enabled
  #checkov:skip=CKV_AWS_21:Ensure all data stored in the S3 bucket have versioning enabled
}

# Enable S3 bucket versioning - Snyk recommended
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.simple-bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}
