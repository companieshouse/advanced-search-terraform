locals {
  secrets = data.vault_generic_secret.secrets.data
  admin_cidrs = values(data.vault_generic_secret.internal_cidrs.data)

  accessible_from_subnet_patterns = jsondecode(local.secrets.accessible_from_subnet_patterns)
  availability_zone_count = length(data.aws_subnets.placement.ids)
  placement_subnet_pattern = local.secrets.placement_subnet_pattern

  zone_awareness_enabled = local.availability_zone_count > 1

  cluster_accessible_cidrs = concat(local.admin_cidrs, data.aws_subnet.accessible_from[*].cidr_block)
}
