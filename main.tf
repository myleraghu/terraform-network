provider "aws" {
  region = "${var.region}"

 # assume_role {
 #   role_arn = "${var.assume_role_arn}"
  #}
}

terraform {
  backend "s3" {}

  required_version = "~> 0.11.14"
}