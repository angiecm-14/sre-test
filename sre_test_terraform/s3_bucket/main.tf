resource "aws_s3_bucket" "this" {
  bucket_prefix = "${var.bucket_prefix}-"

  tags = {
    Name        = "${var.bucket_prefix}"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${aws_s3_bucket.this.arn}/*",
            "Condition": {
                "StringEquals": {
                  "AWS:SourceArn": "${var.cloudfront_arn}"
                }
            }
        }
    ]
  })
}