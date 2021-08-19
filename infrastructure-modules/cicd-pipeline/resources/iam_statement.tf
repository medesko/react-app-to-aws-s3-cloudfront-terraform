resource "aws_iam_role" "codepipeline_frontend" {
  name                 = "${var.application_name}-codepipeline-${var.environment}"
  assume_role_policy   = data.aws_iam_policy_document.codepipeline.json
}

data "aws_iam_policy_document" "codepipeline" {
   statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  } 
}
