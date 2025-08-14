resource "aws_elasticsearch_domain" "advanced_search_elasticsearch" {
  domain_name           = "${var.service}-${var.environment}"
  elasticsearch_version = var.elasticsearch_version

  access_policies = data.aws_iam_policy_document.advanced_search_elasticsearch.json

  # Dedicated master mode
  dynamic "cluster_config" {
    for_each = var.dedicated_master_enabled ? [var.dedicated_master_instance_count] : []

    content {
      instance_type            = var.instance_type
      instance_count           = var.dedicated_master_instance_count
      dedicated_master_type    = var.dedicated_master_instance_type
      dedicated_master_enabled = var.dedicated_master_enabled
      zone_awareness_enabled   = var.zone_awareness_enabled

      dynamic "zone_awareness_config" {
        for_each = var.zone_awareness_enabled ? [var.availability_zone_count] : []

        content {
          availability_zone_count = var.availability_zone_count
        }
      }
    }
  }

  # Shared master/data node mode
  dynamic "cluster_config" {
    for_each = var.dedicated_master_enabled ? [] : [var.dedicated_master_instance_count]

    content {
      instance_type          = var.es_instance_type
      instance_count         = var.es_instance_count
      zone_awareness_enabled = var.zone_awareness_enabled

      dynamic "zone_awareness_config" {
        for_each = var.zone_awareness_enabled ? [var.availability_zone_count] : []

        content {
          availability_zone_count = var.availability_zone_count
        }
      }
    }
  }

  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = var.volume_size
  }

  dynamic "snapshot_options" {
    for_each = var.snapshots_enabled ? [1] : []

    content {
      automated_snapshot_start_hour = var.snapshot_start_hour
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.index_slow_logs_enabled && var.cloudwatch_logging_enabled ? [1] : []

    content {
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.advanced_search_elasticsearch[var.environment].arn
      log_type                 = "INDEX_SLOW_LOGS"
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.search_slow_logs_enabled && var.cloudwatch_logging_enabled ? [1] : []

    content {
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.advanced_search_elasticsearch[var.environment].arn
      log_type                 = "SEARCH_SLOW_LOGS"
    }
  }

  dynamic "log_publishing_options" {
    for_each = var.es_application_logs_enabled && var.cloudwatch_logging_enabled ? [1] : []

    content {
      cloudwatch_log_group_arn = aws_cloudwatch_log_group.advanced_search_elasticsearch[var.environment].arn
      log_type                 = "ES_APPLICATION_LOGS"
    }
  }

  # Note: a hidden dependency exists here; a service-linked role for the Elasticsearch service
  # must exist for vpc_options to be valid; see aws-common-infrastructure-terraform, specifically
  # the service-linked-roles group for a definition of the required role
  vpc_options {
    security_group_ids = [aws_security_group.advanced_search_elasticsearch.id]
    subnet_ids         = var.placement_subnet_ids
  }

  tags = {
    Name        = "${var.service}-${var.environment}-domain"
    Environment = var.environment
    Service     = var.service
  }
}
