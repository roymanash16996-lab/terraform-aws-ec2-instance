data "aws_ami" "default-ubuntu" {
  count       = var.create_instance && var.ami == "" && ( var.os == "ubuntu" && local.is_valid ) ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/${local.image-map[local.image-required]}-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}