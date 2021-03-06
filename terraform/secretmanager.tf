resource "aws_secretsmanager_secret" "my_sandbox" {
  name                    = "tmp/sandbox/secret"
  description             = "my_sandbox secret"
  recovery_window_in_days = 0
  kms_key_id              = aws_kms_key.secretmanager.id
}

resource "aws_secretsmanager_secret_version" "my_sandbox" {
  secret_id = aws_secretsmanager_secret.my_sandbox.id
  secret_string = templatefile("${path.module}/template/secretmanager.json", {
    env = var.env
  })
}
