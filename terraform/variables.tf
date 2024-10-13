variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
  default     = "matkailue.site"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for static website hosting"
  type        = string
  default     = "static-website"
}

variable "cloudfront_price_class" {
  description = "The price class for CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}