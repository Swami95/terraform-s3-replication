resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.bucket_domain_name
    origin_id   = "S3PrimaryBucket"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3PrimaryBucket"

    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Set to "whitelist" or "blacklist" for specific regions
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
