provider "aws" {
  region = var.ecr_values["region"]
}

resource "aws_ecr_repository" "api-test-terraform" {
  name = var.ecr_values["repository_name"]
}