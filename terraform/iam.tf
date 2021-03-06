data "aws_iam_policy_document" "ecs" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type        = "Service"
    }
    actions = ["sts:AssumeRole"]
  }
}
data "aws_iam_policy_document" "secretmanager" {
  statement {
    effect = "Allow"
    resources = [
      aws_secretsmanager_secret.my_sandbox.arn,
      aws_kms_key.secretmanager.arn
    ]
    actions = [
      "secretsmanager:GetSecretValue",
      "kms:Decrypt"
    ]
  }
}
resource "aws_iam_policy" "secret_policy" {
  name   = format("%s-%s-ecs-secret-policy", var.env, var.project)
  path   = "/"
  policy = data.aws_iam_policy_document.secretmanager.json
}
resource "aws_iam_role_policy_attachment" "ecr_secret_policy" {
  policy_arn = aws_iam_policy.secret_policy.arn
  role       = aws_iam_role.ecs_service.name
}
resource "aws_iam_role_policy_attachment" "ecs_task_exec_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.ecs_service.name
}
resource "aws_iam_role_policy_attachment" "ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.ecs_service.name
}
resource "aws_iam_role" "ecs_service" {
  name               = format("%s-%s-ecs-service", var.env, var.project)
  assume_role_policy = data.aws_iam_policy_document.ecs.json

  tags = merge(
    map("Name", format("%s-%s-ecs-service", var.env, var.project)
  ), local.tags)
}


