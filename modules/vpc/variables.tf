# CIDR for VPC
variable "vpc_cidr" {
  type = "string"
}

variable "public_subnet_name" {
  type = "string"
}

variable "private_subnet_name" {
  type = "string"
}

# CIDRs for public subnets
variable "public_subnet_cidrs" {
  type = "list"
}

# CIDRs for private subnets
variable "private_subnet_cidrs" {
  type = "list"
}

# Public Subnet AZs
variable "public_subnet_azs" {
  type = "list"
}

# Private Subnet AZs
variable "private_subnet_azs" {
  type = "list"
}

# Human readable name for VPC
variable "vpc_name" {
  type = "string"
}

# ScopeID
variable "scope_id" {
  type = "string"
}

# ApplicationID
variable "application_id" {
  type = "string"
}

# Contact name
variable "contact_name" {
  type = "string"
}

# Contact email
variable "contact_email" {
  type = "string"
}
