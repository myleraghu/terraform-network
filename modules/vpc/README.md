# VPC module
This module is used to quickly build out VPCs with one public subnet and multiple private subnet_azs

## Variables

### vcp_cidr
This is the initial vpc CIDR block you want the VPC to have

```terraform
vpc_cidr = "10.163.64.0/22"
```

### public_subnet_cidrs
These are the CIDR blocks you want to use as public subnets

```terraform
public_subnet_cidrs = ["10.163.64.0/24"]
```

### private_subnet_cidrs
These are the CIDR blocks you want to use as private subnets

```terraform
private_subnet_cidrs = ["10.163.65.0/24", "10.163.66.0/24"]
```

### public_subnet_azs
These are the AZs you want your public subnets to reside in.

```terraform
public_subnet_azs = ["us-east-2a"]
```

### private_subnet_azs
These are the AZs you want your private subnets to reside in.

```terraform
private_subnet_azs = ["us-east-2b", "us-east-2c"]
```

### environment
This variable is used to dynamically create tags for AWS resources

```terraform
environment = "Enviroment"
```

### vpc_name
This variable is used to dynamically create tags for AWS resources

```terraform
vpc_name = "VPC Name"
```

### contact_name
This variable is used to dynamically create tags for AWS resources

```terraform
contact_name = "Contact Name"
```

### contact_email
This variable is used to dynamically create tags for AWS resources

```terraform
contact_email = "contact@example.com"
```
