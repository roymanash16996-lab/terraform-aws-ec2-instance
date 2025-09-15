data "aws_region" "default" {
  count = local.create && var.region == "" ? 1 : 0
}

data "aws_availability_zones" "default" {
  state = "available"

  region = local.region
}

data "aws_vpc" "default" {
  count   = var.vpc_id == "" ? 1 : 0
  default = true

  region = local.region
}

data "aws_subnet" "default" {
  # This data source is used to get information about subnets in a specified VPC mentioned in the data source above.
  count = var.subnet_id == "" ? 1 : 0

  vpc_id = local.vpc_id

  availability_zone = local.availability_zone
}