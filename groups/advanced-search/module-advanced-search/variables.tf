variable "availability_zone_count" {
  description = "Number of Availability Zones for the domain to use with zone_awareness_enabled. Defaults to 2. Valid values: 2 or 3"
  type        = number
}

variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "cloudwatch_logging_enabled" {
  description = "A boolean value indicating whether cloudwatch logging is enabled; overrides other *_logs_enabled variables"
  type        = bool
}

variable "cluster_accessible_cidrs" {
  description = "A list of CIDRs that the cluster will be accessible from"
  type        = list(string)
}

variable "cluster_accessible_prefix_list_ids" {
  description = "A list of prefix list Ids that the cluster will be accessible from"
  type        = list(string)
}

variable "dedicated_master_enabled" {
  description = "A boolean value indicating whether dedicated master nodes are enabled for the cluster"
  type        = bool
}

variable "dedicated_master_instance_count" {
  description = "Number of dedicated master instances in the cluster; applicable only when dedicated master mode is enabled"
  type        = number
}

variable "dedicated_master_instance_type" {
  description = "Instance type of dedicated master nodes; applicable only when dedicated master mode is enabled"
  type        = string
}

variable "elasticsearch_version" {
  description = "The version of AWS ElasticSearch to use when creating the cluster"
  type        = string
}

variable "environment" {
  description = "The environment name to be used when creating AWS resources"
  type        = string
}

variable "es_application_logs_enabled" {
  description = "A boolean value indicating whether application logs are enabled"
  type        = bool
}

variable "es_instance_count" {
  description = "The number of ElasticSearch EC2 instances to be provisioned"
  type        = number
}

variable "es_instance_type" {
  description = "The type of ElasticSearch EC2 instance to be provisioned"
  type        = string
}

variable "index_slow_logs_enabled" {
  description = "A boolean value indicating whether index slow logs are enabled"
  type        = bool
}

variable "placement_subnet_ids" {
  description = "The list of placement subnet ids"
  type        = list(string)
}

variable "region" {
  description = "The AWS region to target"
  type        = string
}

variable "search_slow_logs_enabled" {
  description = "A boolean value indicating whether search slow logs are enabled"
  type        = bool
}

variable "service" {
  description = "The service name to be used when creating AWS resources"
  type        = string
}

variable "snapshots_enabled" {
  description = "A boolean value indicating whether automated daily snapshots are enabled"
  type        = bool
}

variable "snapshot_start_hour" {
  description = "Hour during which the service takes an automated daily snapshot of the indices in the domain"
  type        = string
}

variable "volume_size" {
  description = "The volume size in GB"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to be used"
  type = string
}

variable "zone_awareness_enabled" {
  description = "A boolean value indicating whether zone awareness is enabled"
  type        = bool
}
