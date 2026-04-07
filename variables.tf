variable "project_name" {
  description = "Project name used for tagging resources"
  type        = string
  default     = "terraform-web"
}

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for the Auto Scaling Group"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH"
  type        = string
  default     = null
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH to instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "min_size" {
  description = "ASG minimum instance count"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "ASG maximum instance count"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "ASG desired instance count"
  type        = number
  default     = 2
}

variable "create_route53" {
  description = "Set true to create Route53 record for CloudFront"
  type        = bool
  default     = false
}

variable "hosted_zone_name" {
  description = "Existing public hosted zone name, for example example.com"
  type        = string
  default     = ""
}

variable "record_name" {
  description = "Subdomain record name, set empty string for zone apex"
  type        = string
  default     = "www"
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN in us-east-1, required when create_route53 is true"
  type        = string
  default     = ""

  validation {
    condition     = !var.create_route53 || length(var.acm_certificate_arn) > 0
    error_message = "acm_certificate_arn is required when create_route53 is true."
  }
}
