resource "aws_subnet" "vpc_public_subnet" {
  count                   = "${var.number_of_availablilty_zones}"
  vpc_id                  = "${vpc.vpc_id}"
  cidr_block              = "${local.public_cidr_blocks[count.index]}"
  map_public_ip_on_launch = true
  tags                    = "${merge(var.tags,
    map("Name", "abc-${terraform.workspace}-public-${data.aws_availability_zones.available.names[count.index]}"))}"

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
}

resource "aws_route_table" "public_route_table" {
  count  = "${var.number_of_availablilty_zones}"
  vpc_id = "${vpc.vpc_id}"
  tags   = "${merge(var.tags,
    map("Name", "abc-${terraform.workspace}-public-route-table-${element(aws_subnet.abc_vpc_public_subnet.*.id, count.index)}"))}"
}
