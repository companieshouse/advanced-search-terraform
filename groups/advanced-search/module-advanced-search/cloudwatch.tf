resource "aws_cloudwatch_log_group" "advanced_search_elasticsearch" {
  for_each = var.cloudwatch_logging_enabled ? toset(["${var.environment}"]) : []

  name = "${var.service}-${var.environment}-log-group"

  tags = {
    Name        = "${var.service}-${var.environment}-log-group"
    Environment = var.environment
    Service     = var.service
  }
}

resource "aws_cloudwatch_log_resource_policy" "logs" {
  for_each = var.cloudwatch_logging_enabled ? toset(["${var.environment}"]) : []

  policy_document = data.aws_iam_policy_document.logs.json
  policy_name     = "${var.service}-${var.environment}-logs-policy"
}
