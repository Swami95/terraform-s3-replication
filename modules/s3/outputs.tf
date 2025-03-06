output "primary_bucket_arn" {
  value = aws_s3_bucket.primary.arn
}

output "secondary_bucket_arn" {
  value = aws_s3_bucket.secondary.arn
}

output "primary_bucket_domain" {
  value = aws_s3_bucket.primary.bucket_regional_domain_name
}