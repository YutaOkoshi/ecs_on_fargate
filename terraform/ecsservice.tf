resource "aws_ecs_service" "debug" {
  name            = format("%s-%s-debug", var.env, var.project)
  cluster         = aws_ecs_cluster.my_sandbox.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.debug.family
  desired_count   = local.ecs_service_desired_count
  # 1.3.0と1.4.0のSeacretManagerの挙動はかなり違うので注意！
  platform_version = "1.4.0"

  network_configuration {
    subnets         = local.private_subnet_ids
    security_groups = [aws_security_group.private_sg.id]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}
