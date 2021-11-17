resource "aws_security_group" "advanced_search_elasticsearch" {
  name        = "${var.environment}-${var.service}-elasticsearch-security-group"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Inbound HTTPS access to Elasticsearch cluster endpoint from VPC"
    cidr_blocks = var.cluster_accessible_cidrs
  }

  tags = {
    Name         = "${var.environment}-${var.service}-elasticsearch-security-group"
    Environment  = var.environment
    Service      = var.service
    AnsibleGroup = "${var.service}-${var.environment}"
  }
  lifecycle { create_before_destroy = true }
}
