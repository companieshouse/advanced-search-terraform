data "aws_caller_identity" "current" {}

data "aws_subnet" "accessible_from" {
  count = length(data.aws_subnets.accessible_from.ids)

  id = data.aws_subnets.accessible_from.ids[count.index]
}

data "aws_subnet" "placement" {
  count = length(data.aws_subnets.placement.ids)

  id = data.aws_subnets.placement.ids[count.index]
}

data "aws_subnets" "accessible_from" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = local.accessible_from_subnet_patterns
  }
}

data "aws_subnets" "placement" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Name"
    values = [local.placement_subnet_pattern]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "vault_generic_secret" "internal_cidrs" {
  path = "aws-accounts/network/internal_cidr_ranges"
}

data "vault_generic_secret" "secrets" {
  path = "team-${var.team}/${var.account_name}/${var.region}/${var.environment}/${var.repository_name}"
}
