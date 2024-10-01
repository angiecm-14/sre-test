variable "bucket_prefix" {
  description = "The prefix of the S3 bucket"
  type        = string
}

variable "cloudfront_arn" {
  description = "The ARN of the CloudFront distribution"
  type        = string
}