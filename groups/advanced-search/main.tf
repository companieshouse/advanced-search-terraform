provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}
}

module "advanced_search" {
  source                          = "./module-advanced-search"

  availability_zone_count         = local.availability_zone_count
  aws_account_id                  = data.aws_caller_identity.current.account_id
  cloudwatch_logging_enabled      = var.cloudwatch_logging_enabled
  cluster_accessible_cidrs        = local.cluster_accessible_cidrs
  dedicated_master_enabled        = var.dedicated_master_enabled
  dedicated_master_instance_count = var.dedicated_master_instance_count
  dedicated_master_instance_type  = var.dedicated_master_instance_type
  elasticsearch_version           = var.elasticsearch_version
  environment                     = var.environment
  es_application_logs_enabled     = var.es_application_logs_enabled
  es_instance_count               = var.es_instance_count
  es_instance_type                = var.es_instance_type
  index_slow_logs_enabled         = var.index_slow_logs_enabled
  placement_subnet_ids            = data.aws_subnet_ids.placement.ids
  region                          = var.region
  search_slow_logs_enabled        = var.search_slow_logs_enabled
  service                         = var.service
  snapshots_enabled               = var.snapshots_enabled
  snapshot_start_hour             = var.snapshot_start_hour
  volume_size                     = var.volume_size
  vpc_id                          = data.aws_vpc.vpc.id
  zone_awareness_enabled          = local.zone_awareness_enabled
}
