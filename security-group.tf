module "security_group" {
  source = "git::https://github.com/roymanash16996-lab/terraform-aws-security-group.git"
  count = var.create_security_group ? 1 : 0

  vpc_id = local.vpc_id
  name   = lookup(var.security_group_details[0], "name", "default-sg")
  description = lookup(var.security_group_details[0], "description", "Managed by Terraform")

}