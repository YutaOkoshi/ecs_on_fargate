resource "aws_kms_key" "secretmanager" {
  description             = format("%s-%s-secret-kms", var.env, var.project)
  deletion_window_in_days = 7
  key_usage               = "ENCRYPT_DECRYPT"
}
