data "aws_caller_identity" "current" {}

data "aws_subnet" "accessible_from" {
  count = length(data.aws_subnet_ids.accessible_from.ids)
  id    = tolist(data.aws_subnet_ids.accessible_from.ids)[count.index]
}

data "aws_subnet" "placement" {
  count = length(data.aws_subnet_ids.placement.ids)
  id    = tolist(data.aws_subnet_ids.placement.ids)[count.index]
}

data "aws_subnet_ids" "accessible_from" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Name"
    values = local.accessible_from_subnet_patterns
  }
}

data "aws_subnet_ids" "placement" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Name"
    values = [local.placement_subnet_pattern]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "${var.account_name}-${var.region}.terraform-state.ch.gov.uk"
    key    = "aws-common-infrastructure-terraform/common-${var.region}/networking.tfstate"
    region = var.region
  }
}

data "vault_generic_secret" "secrets" {
  path = "team-${var.team}/${var.account_name}/${var.region}/${var.environment}/${var.repository_name}"
}
