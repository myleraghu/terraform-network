module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "${var.vpc_cidr}"

  public_subnet_cidrs  = "${var.public_subnet_cidrs}"
  private_subnet_cidrs = "${var.private_subnet_cidrs}"

  public_subnet_azs = ["${var.region}a", "${var.region}b"]

  private_subnet_azs = ["${var.region}c", "${var.region}d"]

  public_subnet_name  = "Public-Subnet-"
  private_subnet_name = "Private-Subnet-"

  # Tags
  scope_id       = "${var.scope_id}"
  application_id = "${var.application_id}"
  vpc_name       = ""
  contact_name   = "${var.contact_name}"
  contact_email  = "${var.contact_email}"
}