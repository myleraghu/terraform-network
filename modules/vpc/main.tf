resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.vpc_name}"
    "Server Name" = "VPC${var.scope_id}${var.application_id}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = "${length(var.public_subnet_cidrs)}"
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${element(var.public_subnet_cidrs, count.index)}"
  availability_zone       = "${element(var.public_subnet_azs, count.index)}"
  map_public_ip_on_launch = "true"

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.public_subnet_name} ${count.index + 1}"
    "Server Name" = "SB${var.scope_id}${var.application_id}${format("%02d", (count.index + 1))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_internet_gateway" "igw" {
  count  = "${(length(var.public_subnet_cidrs) > 0) ? 1 : 0}"
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.vpc_name} IGW"
    "Server Name" = "IGW${var.scope_id}${var.application_id}${format("%02d", (count.index + 1))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_route_table" "public_rt" {
  count = "${(length(var.public_subnet_cidrs) > 0) ? 1 : 0}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.vpc_name} Public Route Table"
    "Server Name" = "RT${var.scope_id}${var.application_id}${format("%02d", ((count.index + length(var.public_subnet_cidrs)) + 1))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_route" "public_route" {
  count                  = "${(length(var.public_subnet_cidrs) > 0) ? 1 : 0}"
  route_table_id         = "${aws_route_table.public_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "aws_route_table_association" "public_subnet_rt_association" {
  count          = "${length(var.public_subnet_cidrs)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_eip" "nat_eip" {
  count      = "${(length(var.public_subnet_cidrs) > 0) ? length(var.public_subnet_cidrs) : 0}"
  vpc        = true
  depends_on = ["aws_internet_gateway.igw"]
}

resource "aws_nat_gateway" "nat_gw" {
  count         = "${(length(var.public_subnet_cidrs) > 0) ? length(var.public_subnet_cidrs) : 0}"
  allocation_id = "${element(aws_eip.nat_eip.*.id, count.index)}"

  # Associated with first public subnet
  subnet_id  = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  depends_on = ["aws_internet_gateway.igw"]

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.vpc_name} NAT Gateway ${count.index + 1}"
    "Server Name" = "NG${var.scope_id}${var.application_id}${format("%02d", (count.index + 1))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = "${length(var.private_subnet_cidrs)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${element(var.private_subnet_cidrs, count.index)}"
  availability_zone = "${element(var.private_subnet_azs, count.index)}"

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.private_subnet_name} ${count.index + 1}"
    "Server Name" = "SB${var.scope_id}${var.application_id}${format("%02d", ((count.index + length(var.public_subnet_cidrs)) + 1))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_route_table" "private_rt" {
  count = "${(length(var.private_subnet_cidrs) > 0) ? length(var.private_subnet_cidrs) : 0}"

  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Environment   = "${var.scope_id}"
    Platform      = "${var.application_id}"
    Name          = "${var.vpc_name} Private Route Table ${count.index + 1}"
    "Server Name" = "RT${var.scope_id}${var.application_id}${format("%02d", ((count.index + length(var.public_subnet_cidrs)) + 1 ))}"
    Contact       = "${var.contact_name}"
    Email         = "${var.contact_email}"
  }
}

resource "aws_route" "private_route" {
  count                  = "${(length(var.private_subnet_cidrs) > 0) ? length(var.private_subnet_cidrs) : 0}"
  route_table_id         = "${element(aws_route_table.private_rt.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gw.*.id, count.index)}"
}

resource "aws_route_table_association" "private_subnet_rt_association" {
  count          = "${length(var.private_subnet_cidrs)}"
  subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_rt.*.id, count.index)}"
}
