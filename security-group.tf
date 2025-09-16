module "security_group" {
  source = "git::https://github.com/roymanash16996-lab/terraform-aws-security-group.git"
  for_each = var.create_security_group ? { for sg in var.security_group_details : lookup(sg, "name", "") => sg } : {}

  vpc_id        = local.vpc_id
  name          = lookup(each.value, "name", local.resource_name)
  description   = lookup(each.value, "description", "Security group for instance ${local.resource_name} for ${each.key}")
  ingress_rules = lookup(each.value, "ingress_rules", [])
  egress_rules  = lookup(each.value, "egress_rules", [])
}