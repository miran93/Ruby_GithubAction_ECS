resource "aws_ecr_repository" "ecr-repository" {
  name                 = var.repository
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}