output "primary_bucket_name" {
  value = module.s3.primary_bucket_arn
}

output "secondary_bucket_name" {
  value = module.s3.secondary_bucket_arn
}

output "iam_role_arn" {
  value = module.iam.iam_role_arn
}

output "cloudfront_url" {
  value = module.cloudfront.cloudfront_url
}
