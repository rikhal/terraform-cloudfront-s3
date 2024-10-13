data "aws_route53_zone" "public_zone" {
  name         = var.domain_name
  private_zone = false
}