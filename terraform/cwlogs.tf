
resource "aws_cloudwatch_log_group" "debug" {
  name              = format("/aws/ecs/%s-%s-debug", var.env, var.project)
  retention_in_days = local.cwlogs_retention_in_days
  tags              = local.tags
}
