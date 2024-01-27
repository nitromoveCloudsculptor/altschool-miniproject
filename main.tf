terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_default_vpc" "default" {
  depends_on = [aws_vpc.my_vpc]
}

module "ec2instance" {
  source = "./ec2"
}

module "load_balancer" {
  source = "./elb"
  
}

module "route53" {
  source = "./route53"
}