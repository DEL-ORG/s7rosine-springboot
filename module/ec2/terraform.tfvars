# AWS Region
aws_region = "us-east-1"

# AMI ID
ami_id = "ami-0866a3c8686eaeeba"

# Key Pair Name
key_name = "jenkins"

# Common Tags
common_tags = {
  id             = "2008"
  owner          = "katya"
  environment    = "dev"
  project        = "springboot"
  create_by      = "Terraform"
  cloud_provider = "aws"
  company        = "EKS"
}
