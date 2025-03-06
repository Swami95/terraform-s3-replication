terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region  = var.aws_region_primary
  profile = "devops-cloud"  # Change to your AWS profile
}

provider "aws" {
  alias   = "west"
  region  = var.aws_region_secondary
  profile = "devops-cloud"  # Change if needed
}
resource "aws_s3_bucket" "primary" {
  bucket = var.primary_bucket_name
}

resource "aws_s3_bucket_versioning" "primary" {
  bucket = aws_s3_bucket.primary.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "secondary" {
  provider = aws.west
  bucket   = var.secondary_bucket_name
}

resource "aws_s3_bucket_versioning" "secondary" {
  provider = aws.west
  bucket   = aws_s3_bucket.secondary.id
  versioning_configuration {
    status = "Enabled"
  }
}
