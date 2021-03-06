locals {
  cwlogs_retention_in_days  = 7
  ecs_service_desired_count = 0
  vpc_id                    = "vpc-0ab1c2d3e4" # vpc-id
  image_name                = "12341234.dkr.ecr.ap-northeast-1.amazonaws.com/my-sandbox/debug"
  image_version             = "latest"
  private_subnet_ids = [
    "subnet-0ab1c2d3e4", # private-subnet-01a
  ]
  endpoint_subnet_ids = [
    "subnet-0ab1c2d3e4", # endpoint-subnet-01a
  ]
  tags = {
    Project = var.project
    Env     = var.env
  }
}
