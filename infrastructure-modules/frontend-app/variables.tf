variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "application_name" {
  description = "The name of the application"
  type = string
}

variable "root_domain_name" {
   default = "frontend.domain.tld"
}

variable "application_subdomain" {
   default = "${var.environment}.frontend.${var.root_domain_name}"
}

variable "environment" {
  description = "Applicaiton environment"
  type = string
}