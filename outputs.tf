#output "peer_connection_id" {
#  value = "${module.management_account_peer.peer_connection_id}"
#}

#output "peer_connection_develop_id" {
#  value = "${module.management_account_peer_dev.peer_connection_id}"
#}

#output "peer_connection_prod_id" {
#  value = "${module.management_account_peer_prod.peer_connection_id}"
#}

output "vpc_cidr" {
  value = "${module.vpc.vpc_cidr}"
}


output "account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "private_subnet_ids" {
  value = "${module.vpc.private_subnet_ids}"
}
output "public_subnet_ids" {
  value = "${module.vpc.public_subnet_ids}"
}
#output "database_subnet_ids" {
#  value = "${module.db_subnets.subnet_ids}"
#}