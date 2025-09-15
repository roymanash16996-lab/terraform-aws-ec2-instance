data "aws_security_group" "default" {
  count = var.security_group_ids == [] ? 1 : 0

  name   = "default"
  vpc_id = local.vpc_id

}