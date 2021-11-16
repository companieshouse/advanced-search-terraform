locals {
  secrets = data.vault_generic_secret.secrets.data

  accessible_from_subnet_patterns = jsondecode(local.secrets.accessible_from_subnet_patterns)
  availability_zone_count = length(data.aws_subnet_ids.placement.ids)
  internal_cidrs = values(data.terraform_remote_state.networking.outputs.internal_cidrs)
  placement_subnet_pattern = local.secrets.placement_subnet_pattern
  vpn_cidrs = values(data.terraform_remote_state.networking.outputs.vpn_cidrs)

  admin_cidrs = concat(local.internal_cidrs,local.vpn_cidrs)
  zone_awareness_enabled = local.availability_zone_count > 1

  cluster_accessible_cidrs = concat(local.admin_cidrs, data.aws_subnet.accessible_from[*].cidr_block)
}
