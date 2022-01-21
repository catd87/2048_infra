provider "aws" {
  region = var.region
}

provider "flux" {
  alias = "flux3-flux"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "github" {
  token = var.flux_token
}

terraform {
  backend "s3" {
   #$bucket = "storage-state"
   #$key    = "storage-state/dev"
   #$region = "us-west-2"
  }
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version       = "2.2.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = "0.2.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.10.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.2"
    }
     aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63.0"
    }
    github = {
      source= "integrations/github"
    }
  }
}

data "aws_availability_zones" "available" {
 state= "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name            = "${var.env}-${var.vpcname}"
  cidr            = var.vpc_cidr  
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.subn_private
  public_subnets  = var.subn_public
  version = "3.11.3"
  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }

}

output "vpc" {
  value = module.vpc
  
  }

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  cluster_name = "${var.env}-${var.cluster_name}"
  vpc_id       = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets
  cluster_version = var.cluster_version
  depends_on = [module.vpc]
  }

module "eks-node-gruop" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "18.2.1"
  cluster_name = module.eks.cluster_id
  node_group_name_prefix = var.node_group_name
  subnet_ids = module.vpc.public_subnets
  desired_size = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
  instance_types = [var.instance_types]

}
