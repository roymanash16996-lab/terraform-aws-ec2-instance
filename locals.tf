locals {
  create = var.create_instance

  resource_name = var.name != "" ? var.name : "terraform-${substr(md5(timestamp()), 0, 8)}"

  vpc_id    = var.vpc_id == "" ? data.aws_vpc.default[0].id : var.vpc_id
  subnet_id = var.subnet_id == "" ? data.aws_subnet.default[0].id : var.subnet_id
  region    = var.region != "" ? var.region : data.aws_region.default[0].region

  availability_zone = var.availability_zone != "" ? var.availability_zone : data.aws_availability_zones.default.names[0]

  valid_ubuntu_versions = ["20-04", "22-04", "23-04", "23-10", "24-04", "25-04"]
  valid_amazon_versions = ["2", "2023"]

  image-required = "${var.os}-${var.os-version}"

  image-map = {
    ubuntu-20-04 = "hvm-ssd/ubuntu-focal-20.04-${var.architecture}-server"
    ubuntu-22-04 = "hvm-ssd/ubuntu-jammy-22.04-${var.architecture}-server"
    ubuntu-23-04 = "hvm-ssd/ubuntu-lunar-23.04-${var.architecture}-server"
    ubuntu-23-10 = "hvm-ssd-gp3/ubuntu-mantic-23.10-${var.architecture}-server"
    ubuntu-24-04 = "hvm-ssd-gp3/ubuntu-noble-24.04-${var.architecture}-server"
    ubuntu-25-04 = "hvm-ssd-gp3/ubuntu-plucky-25.04-${var.architecture}-server"
    # Add more OS types as needed
  }

  ami = var.ami != "" ? var.ami : (
    var.os == "ubuntu" ? data.aws_ami.default-ubuntu[0].id : ""
  )
}