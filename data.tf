data "aws_caller_identity" "current" {}

data "terraform_remote_state" "corp_tools_account" {
  backend = "s3"

  config {
    region = "${var.region}"
    bucket = "${var.corp_tools_account_s3}"
    key    = "${var.corp_tools_account_s3_key}"
  }
}
