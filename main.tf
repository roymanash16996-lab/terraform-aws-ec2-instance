resource "aws_instance" "this" {
  count = local.create ? 1 : 0

  ami           = local.ami
  instance_type = var.instance_type
  subnet_id     = local.subnet_id

  vpc_security_group_ids = var.security_group_ids != [] ? var.security_group_ids : [aws_security_group.default.id]
}