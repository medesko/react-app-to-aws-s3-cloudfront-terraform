variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "region" {
  description = "aws region to deploy stack"
  type        = string
}

variable "application_name" {
  description = "The name of the application"
  type        = string
}

variable "environment" {
  description = "Applicaiton environment"
  type        = string
}

variable "github_org" {
  description = "Github organization"
  type        = string
  default     = "medesko"
}

variable "github_secret_name" {
  type   = string
}

variable "repository_name" {
  description = "Git repos name"
  type        = string
  default     = "terraform-react-app-deployments-aws-s3-cloudfront"
}

variable "branch_name" {
  description = "Git stage branch name"
  type        = string
}