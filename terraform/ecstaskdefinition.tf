resource "aws_ecs_task_definition" "debug" {
  container_definitions = templatefile("${path.module}/template/debug.json", {
    env        = var.env
    version    = local.image_version
    image      = local.image_name
    debug_log  = aws_cloudwatch_log_group.debug.name
    app_name   = var.project
    secret_arn = aws_secretsmanager_secret.my_sandbox.arn
  })
  family                   = format("%s-%s-debug-family", var.env, var.project)
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.ecs_service.arn
  execution_role_arn       = aws_iam_role.ecs_service.arn
  cpu                      = 256
  memory                   = "512"
}
