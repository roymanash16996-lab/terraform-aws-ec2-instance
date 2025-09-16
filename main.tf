resource "time_static" "start" {}

resource "aws_instance" "this" {
  count = local.create ? 1 : 0

  ami           = local.ami
  instance_type = var.instance_type
  subnet_id     = local.subnet_id

  vpc_security_group_ids = local.security_group_ids

  lifecycle {
    ignore_changes = [ 
      module.security_group
     ]
  }
}