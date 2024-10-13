output "s3_website_url" {
  value       = "http://${aws_s3_bucket_website_configuration.website_config.website_endpoint}"
  description = "The URL of the website hosted on S3"
}

output "cloudfront_distribution_domain" {
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "website_url" {
  value       = "https://${var.domain_name}"
  description = "The URL of the website using the custom domain and HTTPS"
}