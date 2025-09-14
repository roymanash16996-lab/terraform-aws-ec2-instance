data "aws_ami" "default" {
  count       = var.create_instance && var.os-type == "ubuntu-22.04" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "2004-x86_64" {
  count       = var.create_instance && var.os-type == "ubuntu-20.04" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "2004-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-20.04" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "2204-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-22.04" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "2304-x86_64" {
  count       = var.create_instance && var.os-type == "ubuntu-23.04" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-lunar-23.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2304-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-23.04" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-lunar-23.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2310-x86_64" {
  count       = var.create_instance && var.os-type == "ubuntu-23.10" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-mantic-23.10-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2310-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-23.10" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-mantic-23.10-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2404-x86_64" {
  count       = var.create_instance && var.os-type == "ubuntu-24.04" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2404-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-24.04" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2504-x86_64" {
  count       = var.create_instance && var.os-type == "ubuntu-25.04" && var.architecture == "x86_64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-plucky-25.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

data "aws_ami" "2504-arm64" {
  count       = var.create_instance && var.os-type == "ubuntu-25.04" && var.architecture == "arm64" && var.ami == "" ? 1 : 0
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-plucky-25.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}