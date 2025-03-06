module "s3" {
  source               = "./modules/s3"
  primary_bucket_name  = var.primary_bucket_name
  secondary_bucket_name = var.secondary_bucket_name
}


module "iam" {
  source = "./modules/iam"
  primary_bucket_arn   = module.s3.primary_bucket_arn
  secondary_bucket_arn = module.s3.secondary_bucket_arn
}

module "cloudfront" {
  source = "./modules/cloudfront"
  bucket_domain_name = module.s3.primary_bucket_domain
}