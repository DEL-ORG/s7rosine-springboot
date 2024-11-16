variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"  # Set your default region if needed
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default = "ami-0866a3c8686eaeeba"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default = "jenkins"
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


variable "instance_types" {
  description = "List of EC2 instance types"
  type        = list(string)
  default     = ["t2.medium", "t2.micro"]
}
