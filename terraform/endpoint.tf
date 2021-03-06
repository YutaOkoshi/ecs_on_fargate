resource "aws_vpc_endpoint" "ecr_api" {
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = local.vpc_id
  subnet_ids        = local.endpoint_subnet_ids
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
  tags = merge(
    map("Name", format("%s-%s-ecr-api-endpoint", var.env, var.project)
  ), local.tags)
}
resource "aws_vpc_endpoint" "ecr_dkr" {
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id            = local.vpc_id
  subnet_ids        = local.endpoint_subnet_ids
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
  tags = merge(
    map("Name", format("%s-%s-ecr-dkr-endpoint", var.env, var.project)
  ), local.tags)
}
resource "aws_vpc_endpoint" "logs" {
  service_name      = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type = "Interface"
  vpc_id            = local.vpc_id
  subnet_ids        = local.endpoint_subnet_ids
  security_group_ids = [
    aws_security_group.vpc_endpoint.id
  ]
  private_dns_enabled = true
  tags = merge(
    map("Name", format("%s-%s-logs-endpoint", var.env, var.project)
  ), local.tags)
}
