output "cloudfront_distribution_url" {
  value = module.cloudfront_distribution.distribution_domain_name
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}