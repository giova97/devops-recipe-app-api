#########################################################################################
# Create ECR repos for storing Docker images #
#########################################################################################

resource "aws_ecr_repository" "app" {
  name                 = "recipe-app-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    #NOTE: update this to true when ready for production
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "recipe-app-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    #NOTE: update this to true when ready for production
    scan_on_push = false
  }
}
