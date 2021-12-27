variable "vpcname" {
  type = string
  default = "vpc_name"
}
variable "env" {
  type = string
  }
variable "cluster_name" {
  type = string
  default = "cluster"
}

 variable "region" {
  type =  string
  default = "us-west-2"

}

variable "target_path" {
  default = "apps"
}

variable "github_owner" {
  default = "catd87"
}

variable "repository_name" {
  default = "CTK"
  }

variable "branch" {
  default = "main"  
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "subn_private" {
  description = "subnets"
  type        = list 
}
variable "subn_public" {
  description = "subnets"
  type        = list 
  }
variable "cluster_version"{
   type = string
}

 variable "type_service" {
   description = "tipo de servicio"
   type = string
    
}

variable "service_name" {
    type = string      
}

variable "port1" {
    type = string
    
}

variable "target_port" {
    type = string
 
}

variable "container_name" {
    type = string    
}

variable "desired_capacity" {
    description = "desired capacity"
    type = number   
}

variable "max_size" {
    type = number  
}

variable "min_size" {
    type = number  
}

variable "instance_types" {
    type = string 
}

variable "image" {
    type = string     
}

variable "namespace" {
    type = string
}

variable "node_group_name" {
    type = string
}

variable "default_components" {
  type = list
}

variable "flux_token" {}
variable "repo_provider" {}  
variable "repo_url" {}
variable "bucket"{}
variable "key" {}
variable "infra_bucket" {
  type = map(any)
  default = {
    dev   = "project-terraform-state-dev"
    stage = "project-terraform-state-stage"
    prod  = "project-terraform-state-prod"
  }
}

variable "infra_file" {
  type = map(any)
  default = {
    dev   = "dev/project-eks-bootstrap.tfstate"
    stage = "stage/project-eks-bootstrap.tfstate"
    prod  = "prod/project-eks-bootstrap.tfstate"
  }
}

variable "components" {
  type = list
}