locals {
  create = var.create_instance

  region = var.region != "" ? var.region : data.aws_region.default[0].region

  valid_ubuntu_versions = ["20-04", "22-04", "23-04", "23-10", "24-04", "25-04"]
  valid_amazon_versions = ["2", "2023"]

  is_valid = (
    (var.os == "ubuntu" && contains(local.valid_ubuntu_versions, var.os-version)) ||
    (var.os == "amazon-linux" && contains(local.valid_amazon_versions, var.os-version))
  )

  image-required = local.is_valid ? "${var.os}-${var.os-version}" : null_resource.validate_os_version

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
  
  vpc_id = var.vpc_id == "" ? data.aws_vpc.default[0].id : data.aws_vpc.provided-vpc[0].id
  subnet_id = data.aws_subnet.this.id
}