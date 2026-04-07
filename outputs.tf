output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.app.dns_name
}

output "route53_record_fqdn" {
  description = "Route53 DNS name created for CloudFront"
  value       = var.create_route53 ? aws_route53_record.cdn_alias[0].fqdn : null
}
