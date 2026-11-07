module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = var.name
  cidr = var.cidr
  azs  = var.azs

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true


  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # public subnets will have the elb tag
  public_subnet_tags = { 
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = {
    Project = "ForgejoHub"
    Environment = var.environment
    ManagedBy = "Terraform"
  }



}