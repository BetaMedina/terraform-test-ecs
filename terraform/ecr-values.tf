variable "ecr_values" {
  type = map(string)

  default = {
    region = "us-east-1"
    repository_name = "test_deploy_api_terraform_ecr"
  }
}