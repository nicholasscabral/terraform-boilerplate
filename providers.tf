terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
  backend "s3" {
    bucket  = "iac-state-bucket-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
    profile  = "terraform" // AWS cli profile (iam user)
  }

}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform" // AWS cli profile (iam user)
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.terraform_state]
}
