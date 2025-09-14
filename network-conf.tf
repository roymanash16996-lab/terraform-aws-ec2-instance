data "aws_region" "default" {
  count = local.create ? 1 : 0
}

data "aws_vpc" "default" {
  count   = var.vpc_id == "" ? 1 : 0
  default = true

  region = local.region
}

data "aws_vpc" "provided-vpc" {
  # This data source is used to get information about a specific VPC if the VPC ID is provided in the variable "vpc_id".
  count = var.vpc_id != "" ? 1 : 0

  id = var.vpc_id

  region = local.region
}

data "aws_subnet" "this" {
  # This data source is used to get information about subnets in a specified VPC mentioned in the data source above.

  vpc_id = local.vpc_id

  dynamic "filter" {
    for_each = var.subnet_type != "" ? [1] : []
    content {
      name   = "tag:Name"
      values = ["*${var.subnet_type}*"]
    }
  }

  availability_zone = var.availability_zone != "" ? var.availability_zone : var.vpc_id == "" ? data.aws_vpc.default[0].availability_zones[0] : data.aws_vpc.provided-vpc[0].availability_zones[0]
}