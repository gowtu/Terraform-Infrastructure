output "vpc_id" {
  value = "${vpc.vpc_id}"
}

output "public_subnet_ids" {
  value = "${aws_subnet.vpc_public_subnet.*.id}"
}

output "private_subnet_ids" {
  value = "${aws_subnet.vpc_private_subnet.*.id}"
}
