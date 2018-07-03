locals {
  vpc = {
    cidr_block      = "10.0.0.0/21"
    name            = "abc-${terraform.workspace}"
    default_security_name = "abc-${terraform.workspace}-default-security"
  }

  public_cidr_blocks = [
    "10.0.0.0/22",
  ]

  private_cidr_blocks = [
    "10.0.2.0/22",
  ]

  tags = "${var.tags}"
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

data "aws_caller_identity" "current_identity" {}
