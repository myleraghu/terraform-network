variable "region" {
  type = "string"
}

variable "environment" {
  type = "string"
}

#variable "assume_role_arn" {
#  type = "string"
#}

#variable "log_aggregation_bucket" {
#  type = "string"
#}

variable "vpc_cidr" {
  type = "string"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "private_subnet_cidrs" {
  type = "list"
}

#variable "database_subnet_cidrs" {
#  type = "list"
#}

variable "corp_tools_account_s3" {
  type = "string"
}

variable "corp_tools_account_s3_key" {
  type = "string"
}

# Tagging
variable "scope_id" {
  type = "string"
}

variable "application_id" {
  type = "string"
}

variable "contact_name" {
  type = "string"
}

variable "contact_email" {
  type = "string"
}
