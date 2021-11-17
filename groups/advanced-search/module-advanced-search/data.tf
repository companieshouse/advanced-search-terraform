data "aws_iam_policy_document" "advanced_search_elasticsearch" {
  statement {
    effect = "Allow"

    sid = "AllowAccessToElasticSearchCluster"

    principals {
      type = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "es:*"
    ]

    resources = [
      "arn:aws:es:${var.region}:${var.aws_account_id}:domain/advanced-search-${var.environment}/*"
    ]
  }
}

data "aws_iam_policy_document" "logs" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
    ]

    resources = ["arn:aws:logs:*"]

    principals {
      identifiers = ["es.amazonaws.com"]
      type        = "Service"
    }
  }
}
