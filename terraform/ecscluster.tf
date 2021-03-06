resource "aws_ecs_cluster" "my_sandbox" {
  name = format("%s-%s-cluster", var.env, var.project)
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = merge(
    map("Name", format("%s-%s-cluster", var.env, var.project)
  ), local.tags)
}
