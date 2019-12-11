region = "us-east-2"

environment = "perf"

# Automation User Role Arn
assume_role_arn = "arn:aws:iam::<account_id>:role/AutomationUserRole"

log_aggregation_bucket = ""

# VPC
vpc_cidr = ""

public_subnet_cidrs = ["", ""]

private_subnet_cidrs = ["", ""]

# Corp Tools

corp_tools_account_s3 = "edgenuity-tf-state"

corp_tools_account_s3_key = "corp-tools/terraform.tfstate"

# Tagging

scope_id = "PF"

application_id = ""

contact_name = ""

contact_email = ""
