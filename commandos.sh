#!/bin/bash
terraform init --backend-config="bucket=storage-state" --backend-config="key=${ENV}/terraform.state" --backend-config="region=${AWS_REGION}"
terraform validate
terraform plan --var-file=env/${ENV}.tfvars 
#terraform apply --auto-approve --var-file=env/${ENV}.tfvars 
