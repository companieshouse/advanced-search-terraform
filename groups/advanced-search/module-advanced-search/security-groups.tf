resource "aws_security_group" "advanced_search_elasticsearch" {
  name   = "${var.environment}-${var.service}-elasticsearch-security-group"
  vpc_id = var.vpc_id

  ingress = []

  tags = {
    Name         = "${var.environment}-${var.service}-elasticsearch-security-group"
    Environment  = var.environment
    Service      = var.service
    AnsibleGroup = "${var.service}-${var.environment}"
  }
  lifecycle { create_before_destroy = true }
}

resource "aws_vpc_security_group_ingress_rule" "cidrs" {
  for_each = toset(var.cluster_accessible_cidrs)

  security_group_id = aws_security_group.advanced_search_elasticsearch.id

  description = "Inbound HTTPS access to Elasticsearch cluster endpoint from ${each.value}"
  cidr_ipv4   = each.value
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_ingress_rule" "prefix_lists" {
  for_each = toset(var.cluster_accessible_prefix_list_ids)

  security_group_id = aws_security_group.advanced_search_elasticsearch.id

  description    = "Inbound HTTPS access to Elasticsearch cluster endpoint from ${each.value}"
  from_port      = 443
  ip_protocol    = "tcp"
  prefix_list_id = each.value
  to_port        = 443
}
