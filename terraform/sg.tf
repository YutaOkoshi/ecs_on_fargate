
resource "aws_security_group" "private_sg" {
  name   = format("%s-%s-private-sg", var.env, var.project)
  vpc_id = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    map("Name", format("%s-%s-private-sg", var.env, var.project)
  ), local.tags)
}
resource "aws_security_group_rule" "vpc_endpoint_ingress_443" {
  type                     = "ingress"
  security_group_id        = aws_security_group.vpc_endpoint.id
  description              = "is private sg id"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.private_sg.id
}
resource "aws_security_group" "vpc_endpoint" {
  name   = format("%s-%s-vpc-endpoint-sg", var.env, var.project)
  vpc_id = local.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(
    map("Name", format("%s-%s-vpc-endpoint-sg", var.env, var.project)
  ), local.tags)
}

