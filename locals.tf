locals {
  create = var.create_instance

  ami_map = {
    "ubuntu-20.04_x86_64" = "${data.aws_ami.2004-x86_64[0].id}",
    "ubuntu-20.04_arm64"  = "${data.aws_ami.2004-arm64[0].id}",
    "ubuntu-22.04_x86_64"  = "${data.aws_ami.2204-x86_64[0].id}",
    "ubuntu-22.04_arm64"  = "${data.aws_ami.2204-arm64[0].id}",
    "ubuntu-23.04_x86_64" = "${data.aws_ami.2304-x86_64[0].id}",
    "ubuntu-23.04_arm64"  = "${data.aws_ami.2304-arm64[0].id}",
    "ubuntu-23.10_x86_64" = "${data.aws_ami.2310-x86_64[0].id}",
    "ubuntu-23.10_arm64"  = "${data.aws_ami.2310-arm64[0].id}",
    "ubuntu-24.04_x86_64" = "${data.aws_ami.2404-x86_64[0].id}",
    "ubuntu-24.04_arm64"  = "${data.aws_ami.2404-arm64[0].id}",
    "ubuntu-25.04_x86_64" = "${data.aws_ami.2504-x86_64[0].id}",
    "ubuntu-25.04_arm64"  = "${data.aws_ami.2504-arm64[0].id}"
  }

  region = var.region != "" ? var.region : data.aws_region.default[0].region

  ami = var.ami != "" ? var.ami : lookup(local.ami_map, "${var.os-type}_${var.architecture}", "${data.aws_ami.2204-x86_64[0].id}")
  vpc_id = var.vpc_id == "" ? data.aws_vpc.default[0].id : data.aws_vpc.provided-vpc[0].id
  subnet_id = data.aws_subnet.this.id
}