variable "aws_source_region" {
  type        = string
  default     = "us-east-1"
}

variable "aws_destination_region" {
  type        = string
  default     = "us-east-2"
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "common_tags" {
  description = "Common tags for all resources"
  type = map(string)
  default = {
  id             = "2008"
  owner          = "katya"
  environment    = "dev"
  project        = "springboot"
  create_by      = "Terraform"
  cloud_provider = "aws"
  company        = "EKS"
}
  }

