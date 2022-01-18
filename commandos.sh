#!/bin/bash
aws eks update-kubeconfig --region $AWS_REGION --name project_eks_cluster-$ENV --kubeconfig "~/.kube/config"
terraform init \
-backend-config="bucket=storage-state" \
-backend-config="key=${ENV}/storage-state.tfstate" \
-backend-config="region=${AWS_REGION}"
terraform validate
terraform plan --var-file=env/${ENV}.tfvars 
#terraform apply --auto-approve --var-file=env/${ENV}.tfvars 
