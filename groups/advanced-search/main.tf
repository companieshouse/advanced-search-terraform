terraform {
  required_version = ">= 1.3, < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.0, < 6.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = var.region
}

module "advanced_search" {
  source = "./module-advanced-search"

  aws_account_id       = data.aws_caller_identity.current.account_id
  environment          = var.environment
  placement_subnet_ids = data.aws_subnets.placement.ids
  region               = var.region
  service              = var.service
  vpc_id               = data.aws_vpc.vpc.id

  availability_zone_count         = local.availability_zone_count
  cloudwatch_logging_enabled      = var.cloudwatch_logging_enabled
  dedicated_master_enabled        = var.dedicated_master_enabled
  dedicated_master_instance_count = var.dedicated_master_instance_count
  dedicated_master_instance_type  = var.dedicated_master_instance_type
  elasticsearch_version           = var.elasticsearch_version
  es_application_logs_enabled     = var.es_application_logs_enabled
  es_instance_count               = var.es_instance_count
  es_instance_type                = var.es_instance_type
  index_slow_logs_enabled         = var.index_slow_logs_enabled
  search_slow_logs_enabled        = var.search_slow_logs_enabled
  snapshots_enabled               = var.snapshots_enabled
  snapshot_start_hour             = var.snapshot_start_hour
  volume_size                     = var.volume_size
  zone_awareness_enabled          = local.zone_awareness_enabled

  cluster_accessible_cidrs           = local.cluster_accessible_cidrs
  cluster_accessible_prefix_list_ids = local.cluster_accessible_prefix_list_ids
}
