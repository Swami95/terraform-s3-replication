variable "aws_region_primary" {
  description = "Primary AWS region"
  default     = "us-east-1"
}

variable "aws_region_secondary" {
  description = "Secondary AWS region"
  default     = "us-west-2"
}

variable "primary_bucket_name" {
  description = "Name of the primary S3 bucket"
  default     = "primary-bucket"
}

variable "secondary_bucket_name" {
  description = "Name of the secondary S3 bucket"
  default     = "secondary-bucket"
}

variable "cloudfront_enabled" {
  description = "Enable CloudFront CDN"
  default     = true
}
