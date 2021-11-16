# advanced-search

Provisions an elasticsearch cluster

# Terraform variables

| Name                            | Description                                                                                  | Default                     | Example                   | Notes                                                 |
| ------------------------------- | -------------------------------------------------------------------------------------------- | --------------------------- | ------------------------- | ----------------------------------------------------- |
| account_name                    | The name of the AWS account we're using                                                      | `-`                         | `development`             | -                                                     |
| cloudwatch_logging_enabled      | A boolean value indicating whether cloudwatch logging is enabled                             | `false`                     | `true`                    | -                                                     |
| dedicated_master_enabled        | A boolean value indicating whether dedicated master nodes are enabled for the cluster        | `false`                     | `true`                    | -                                                     |
| dedicated_master_instance_count | Number of dedicated master instances in the cluster                                          | `0`                         | `3`                       | Applicable only when dedicated master mode is enabled |
| dedicated_master_instance_type  | Instance type of dedicated master nodes                                                      | `-`                         | `t3.medium.elasticsearch` | Applicable only when dedicated master mode is enabled |
| elasticsearch_version           | The version of AWS ElasticSearch to use when creating the cluster                            | `7.10`                      | `7.9`                     | -                                                     |
| environment                     | The environment name to be used when creating AWS resources                                  | `-`                         | `my_environment`          | -                                                     |
| es_application_logs_enabled     | A boolean value indicating whether application logs are enabled                              | `false`                     | `true`                    | -                                                     |
| es_instance_count               | The number of ElasticSearch EC2 instances to be provisioned                                  | `1`                         | `3`                       | -                                                     |
| es_instance_type                | The type of ElasticSearch EC2 instance to be provisioned                                     | `-`                         | `t3.medium.elasticsearch` | -                                                     |
| index_slow_logs_enabled         | A boolean value indicating whether index slow logs are enabled                               | `false`                     | `true`                    | -                                                     |
| region                          | The AWS region in which resources will be administered                                       | `-`                         | `eu-west-2`               | -                                                     |
| repository_name                 | The name of the repository in which we're operating                                          | `advanced-search-terraform` | `-`                       | -                                                     |
| search_slow_logs_enabled        | A boolean value indicating whether search slow logs are enabled                              | `false`                     | `true`                    | -                                                     |
| service                         | The service name to be used when creating AWS resources                                      | `advanced-search`           | `-`                       | -                                                     |
| snapshots_enabled               | A boolean value indicating whether automated daily snapshots are enabled                     | `false`                     | `true`                    | -                                                     |
| snapshot_start_hour             | Hour during which the service takes an automated daily snapshot of the indices in the domain | `23`                        | `22`                      | -                                                     |
| team                            | The team responsible for administering the instance                                          | `platform`                  | `apollo`                  | -                                                     |
| volume_size                     | The volume size in GB                                                                        | `20`                        | `30`                      | -                                                     |
| vpc_name                        | The name of the VPC into which we're provisioning                                            | `-`                         | `my_vpc`                  | -                                                     |
