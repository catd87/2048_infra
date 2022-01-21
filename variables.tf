variable "vpcname" {
    type    = string
    default = "vpcname"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

 variable "region" {
  type =  string
  default = "us-west-2"

}

variable "flux_token" {}

variable "env" {
  type = string
  }

variable "cluster_name" {
  type = string
  default = "cluster"
}

variable "subn_public" {
  description = "subnets"
  type        = list 
  }

variable "cluster_version"{
   type = string
}

variable "node_group_name" {
    type = string
}

variable "desired_capacity" {
    description = "desired capacity"
    type = number   
}

variable "min_size" {
    type = number  
}

variable "max_size" {
    type = number  
}

variable "instance_types" {
    type = string 
}