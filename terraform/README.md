## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.71.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.ssl_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.oai](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.website_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.website_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.website_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.website_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.website_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.index_html](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [random_string.bucket_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_route53_zone.public_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket for static website hosting | `string` | `"static-website"` | no |
| <a name="input_cloudfront_price_class"></a> [cloudfront\_price\_class](#input\_cloudfront\_price\_class) | The price class for CloudFront distribution | `string` | `"PriceClass_100"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the website | `string` | `"matkailue.site"` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy resources | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_distribution_domain"></a> [cloudfront\_distribution\_domain](#output\_cloudfront\_distribution\_domain) | The domain name of the CloudFront distribution |
| <a name="output_s3_website_url"></a> [s3\_website\_url](#output\_s3\_website\_url) | The URL of the website hosted on S3 |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | The URL of the website using the custom domain and HTTPS |
