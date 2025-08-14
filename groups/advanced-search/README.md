# advanced-search

Provisions an elasticsearch cluster


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3, < 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0, < 6.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 5.0, < 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0, < 6.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 5.0, < 6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_advanced_search"></a> [advanced\_search](#module\_advanced\_search) | ./module-advanced-search | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_ec2_managed_prefix_list.admin](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_managed_prefix_list) | data source |
| [aws_subnet.accessible_from](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.placement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.accessible_from](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.placement](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The name of the AWS account we're using | `string` | n/a | yes |
| <a name="input_cloudwatch_logging_enabled"></a> [cloudwatch\_logging\_enabled](#input\_cloudwatch\_logging\_enabled) | A boolean value indicating whether cloudwatch logging is enabled; overrides other *\_logs\_enabled variables | `bool` | `false` | no |
| <a name="input_dedicated_master_enabled"></a> [dedicated\_master\_enabled](#input\_dedicated\_master\_enabled) | A boolean value indicating whether dedicated master nodes are enabled for the cluster | `bool` | `false` | no |
| <a name="input_dedicated_master_instance_count"></a> [dedicated\_master\_instance\_count](#input\_dedicated\_master\_instance\_count) | Number of dedicated master instances in the cluster; applicable only when dedicated master mode is enabled | `number` | `0` | no |
| <a name="input_dedicated_master_instance_type"></a> [dedicated\_master\_instance\_type](#input\_dedicated\_master\_instance\_type) | Instance type of dedicated master nodes; applicable only when dedicated master mode is enabled | `string` | n/a | yes |
| <a name="input_elasticsearch_version"></a> [elasticsearch\_version](#input\_elasticsearch\_version) | The version of AWS ElasticSearch to use when creating the cluster | `string` | `"7.10"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name to be used when creating AWS resources | `string` | n/a | yes |
| <a name="input_es_application_logs_enabled"></a> [es\_application\_logs\_enabled](#input\_es\_application\_logs\_enabled) | A boolean value indicating whether application logs are enabled | `bool` | `false` | no |
| <a name="input_es_instance_count"></a> [es\_instance\_count](#input\_es\_instance\_count) | The number of ElasticSearch EC2 instances to be provisioned | `number` | `1` | no |
| <a name="input_es_instance_type"></a> [es\_instance\_type](#input\_es\_instance\_type) | The type of ElasticSearch EC2 instance to be provisioned | `string` | n/a | yes |
| <a name="input_hashicorp_vault_password"></a> [hashicorp\_vault\_password](#input\_hashicorp\_vault\_password) | The password used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_username"></a> [hashicorp\_vault\_username](#input\_hashicorp\_vault\_username) | The username used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_index_slow_logs_enabled"></a> [index\_slow\_logs\_enabled](#input\_index\_slow\_logs\_enabled) | A boolean value indicating whether index slow logs are enabled | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region in which resources will be administered | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the repository in which we're operating | `string` | `"advanced-search-terraform"` | no |
| <a name="input_search_slow_logs_enabled"></a> [search\_slow\_logs\_enabled](#input\_search\_slow\_logs\_enabled) | A boolean value indicating whether search slow logs are enabled | `bool` | `false` | no |
| <a name="input_service"></a> [service](#input\_service) | The service name to be used when creating AWS resources | `string` | `"advanced-search"` | no |
| <a name="input_snapshot_start_hour"></a> [snapshot\_start\_hour](#input\_snapshot\_start\_hour) | Hour during which the service takes an automated daily snapshot of the indices in the domain | `string` | `23` | no |
| <a name="input_snapshots_enabled"></a> [snapshots\_enabled](#input\_snapshots\_enabled) | A boolean value indicating whether automated daily snapshots are enabled | `bool` | `false` | no |
| <a name="input_team"></a> [team](#input\_team) | The team responsible for administering the instance | `string` | `"platform"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The volume size in GB | `string` | `20` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The name of the VPC into which we're provisioning | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->