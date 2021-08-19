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

resource "aws_iam_policy" "codepipeline_frontend" {
  name        = "${var.application_name}-codepipeline-${var.environment}"
  description = "Allow Codepipeline deployments"
  policy      = data.aws_iam_policy_document.codepipeline_frontend.json
}

resource "aws_iam_role_policy_attachment" "codepipeline_frontend" {
  role       = aws_iam_role.codepipeline_frontend.name
  policy_arn = aws_iam_policy.codepipeline_frontend.arn
}

data aws_iam_policy_document codepipeline_frontend {
  statement {
    effect = "Allow"

    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::*"
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "codebuild:StartBuild",
      "codebuild:StopBuild",
      "codebuild:BatchGetBuilds"
    ]

    resources = ["arn:aws:codebuild:${var.region}:*"]
  }
}
