resource "random_string" "bucket_prefix" {
  length           = 6
  special          = false
  numeric          = false
  upper            = false 
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = "${random_string.bucket_prefix.id}-${var.region}-${var.bucket_name}"
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id
  
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "website_public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
        }
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      },
      {
        Sid       = "AllowCurrentUserPutObject"
        Effect    = "Allow"
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        }
        Action   = "s3:PutObject"
        Resource = [
          aws_s3_bucket.website_bucket.arn,
          "${aws_s3_bucket.website_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  source       = "./assets/index.html"
  content_type = "text/html"
}