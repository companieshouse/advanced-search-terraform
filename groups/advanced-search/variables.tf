variable "account_name" {
  description = "The name of the AWS account we're using"
  type        = string
}

variable "cloudwatch_logging_enabled" {
  default       = false
  description   = "A boolean value indicating whether cloudwatch logging is enabled; overrides other *_logs_enabled variables"
  type          = bool
}

variable "dedicated_master_enabled" {
  default       = false
  description   = "A boolean value indicating whether dedicated master nodes are enabled for the cluster"
  type          = bool
}

variable "dedicated_master_instance_count" {
  default       = 0
  description   = "Number of dedicated master instances in the cluster; applicable only when dedicated master mode is enabled"
  type          = number
}

variable "dedicated_master_instance_type" {
  description   = "Instance type of dedicated master nodes; applicable only when dedicated master mode is enabled"
  type          = string
}

variable "elasticsearch_version" {
  default       = "7.10"
  description   = "The version of AWS ElasticSearch to use when creating the cluster"
  type          = string
}

variable "environment" {
  description = "The environment name to be used when creating AWS resources"
  type        = string
}

variable "es_application_logs_enabled" {
  default       = false
  description   = "A boolean value indicating whether application logs are enabled"
  type          = bool
}

variable "es_instance_count" {
  default       = 1
  description   = "The number of ElasticSearch EC2 instances to be provisoned"
  type          = number
}

variable "es_instance_type" {
  description = "The type of ElasticSearch EC2 instance to be provisioned"
  type        = string
}

variable "index_slow_logs_enabled" {
  default       = false
  description   = "A boolean value indicating whether index slow logs are enabled"
  type          = bool
}

variable "region" {
  description = "The AWS region in which resources will be administered"
  type        = string
}

variable "repository_name" {
  default       = "advanced-search-terraform"
  description   = "The name of the repository in which we're operating"
  type          = string
}

variable "search_slow_logs_enabled" {
  default       = false
  description   = "A boolean value indicating whether search slow logs are enabled"
  type          = bool
}

variable "service" {
  default     = "advanced-search"
  description = "The service name to be used when creating AWS resources"
  type        = string
}

variable "snapshots_enabled" {
  default       = false
  description   = "A boolean value indicating whether automated daily snapshots are enabled"
  type          = bool
}

variable "snapshot_start_hour" {
  default       = 23
  description   = "Hour during which the service takes an automated daily snapshot of the indices in the domain"
  type          = string
}

variable "team" {
  default     = "platform"
  description = "The team responsible for administering the instance"
  type        = string
}

variable "volume_size" {
  default       = 20
  description   = "The volume size in GB"
  type          = string
}

variable "vpc_name" {
  description   = "The name of the VPC into which we're provisioning"
  type          = string
}
