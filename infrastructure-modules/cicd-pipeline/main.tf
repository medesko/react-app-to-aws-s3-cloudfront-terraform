data "aws_secretsmanager_secret" "github_secret" {
  name = var.github_secret_name
}

data "aws_secretsmanager_secret_version" "github_token" {
  secret_id = data.aws_secretsmanager_secret.github_secret.id
}

module "frontend_and_cicd_pipeline" {
  source = "./resources"
  application_name = var.application_name
  s3_bucket_destination = "${var.application_name}-${var.environment}"
  pipeline_bucket_name = "${var.application_name}-codepipeline"
  codebuild_bucket_name = "${var.application_name}-codebuild"
  github_org = var.github_org
  repository_name = var.repository_name
  branch_name = var.branch_name
  environment = var.environment
  github_token = jsondecode(data.aws_secretsmanager_secret_version.github_token.secret_string)["GITHUB_ACCESS_TOKEN"]
}