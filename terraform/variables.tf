variable "project" {
  default = "sandbox"
}
variable "env" {
  default = "my"
}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
