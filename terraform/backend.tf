terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "terraform-simple-cicd-action-wtc.tfstate"
    region = "us-east-1"
  }
}