module "s3_bucket" {
  source         = "./s3_bucket"
  bucket_prefix  = var.bucket_prefix
  cloudfront_arn = module.cloudfront_distribution.cloudfront_arn
}

module "cloudfront_distribution" {
  source                = "./cloudfront_distribution"
  s3_bucket_arn         = module.s3_bucket.bucket_arn
  s3_bucket_domain_name = module.s3_bucket.bucket_domain_name
}