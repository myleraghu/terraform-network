region = "us-east-1"

environment = "test-env-raghu"

# Automation User Role Arn
#assume_role_arn = "arn:aws:iam::<account_id>:role/AutomationUserRole"

#log_aggregation_bucket = ""

# VPC
vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

#database_subnet_cidrs = ["", "", ""]

# Corp Tools

corp_tools_account_s3 = "terraform-user"

corp_tools_account_s3_key = "corp-tools/terraform.tfstate"

# Tagging

scope_id = "test-Env"

application_id = "test-application-raghu"

contact_name = "myleraghu"

contact_email = "myleraghu@xyz.com"
