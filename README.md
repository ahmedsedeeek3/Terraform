# Terraform Web Architecture

This project provisions the architecture shown in the diagram:

- Route 53 (optional custom domain)
- CloudFront distribution
- Application Load Balancer (ALB)
- Auto Scaling Group with EC2 instances serving hello-world page

## What gets created

- VPC with 2 public subnets
- Internet Gateway and routing
- Security groups for ALB and EC2
- ALB + Target Group + HTTP Listener
- Launch Template + Auto Scaling Group
- CloudFront distribution in front of ALB
- Optional Route 53 alias record to CloudFront

## Prerequisites

- Terraform 1.5+
- AWS credentials configured locally

## Usage

1. Initialize and plan:

```bash
terraform init
cp terraform.tfvars.example terraform.tfvars
terraform plan
```

2. Apply:

```bash
terraform apply
```

3. After apply, open CloudFront URL from output `cloudfront_domain_name`.

## Optional custom domain

If you want `Route 53 + your domain`:

- Set `create_route53 = true`
- Set `hosted_zone_name`
- Set `record_name` (or empty string for root/apex)
- Set `acm_certificate_arn` for a certificate in `us-east-1`

Then run:

```bash
terraform apply
```

## Destroy

```bash
terraform destroy
```
