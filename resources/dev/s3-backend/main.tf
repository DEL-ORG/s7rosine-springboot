terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  alias  = "source-region"
  region = local.aws_source_region
}

provider "aws" {
  alias  = "destination-region"
  region = local.aws_destination_region
}

locals {
aws_source_region   = "us-east-1"
aws_destination_region = "us-east-2"
  force_destroy     = true
 common_tags = {

    id             = "2008"
    owner          = "katya"
    environment    = "dev"
    project        = "springboot"
    create_by      = "Terraform"
    cloud_provider = "aws"
    company        = "EKS"
  }

}


module "s3-backend" {
  source = "../../../module/s3-backend-replication"
  aws_source_region   = "us-east-1"
  aws_destination_region = "us-east-2"
  force_destroy     = local.force_destroy
  common_tags       = local.common_tags
}
