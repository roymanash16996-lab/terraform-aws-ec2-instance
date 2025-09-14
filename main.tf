resource "aws_instance" "this" {
  count         = local.create ? 1 : 0

  ami           = local.ami
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.this.id
}