# Base Account Infrastructure
This is used to stand up base account resources and serves as a template for new accounts

## Prerequisites
- Terraform 0.11.8
- AWS CLI Profile configured

## Getting Started
To get started developing in terraform, run the following command to set up your terraform environment

### Set Up
```sh
terraform init -backend-config="bucket=edgenuity-tf-state" -backend-config="key=<account>-<environment>/terraform.tfstate" -backend-config="region=us-east-2" -backend-config="dynamodb_table=<state-lock-table>"
```
"# acount-infra-terraform" 
"# acount-infra-terraform" 
