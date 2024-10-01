resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name              = var.s3_bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    origin_id                = var.s3_bucket_domain_name
  }

  enabled             = true

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    target_origin_id        = var.s3_bucket_domain_name
    viewer_protocol_policy  = "redirect-to-https"
    allowed_methods         = ["GET", "HEAD"]
    cached_methods          = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }      
    }
    
    min_ttl     = 0
    max_ttl     = 31536000
    default_ttl = 86400
  }  

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "${var.s3_bucket_domain_name}"
  description                       = "${var.s3_bucket_domain_name} access control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "Access Identity for S3 Bucket"
}