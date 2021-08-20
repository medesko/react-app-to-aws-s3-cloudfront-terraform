# How to auto deploy react app to aws S3 & CloudFront using terraform

This repository contains the source code

## Goal 

1 - The CI/CD pipeline pulls the source code from GitHub and run tests against the application before deploying it to an aws S3 bucket for frontend hosting.

2 - The frontend will then be distributed using CloudFront which will point to the S3 bucket. 

3 - All of the infrastructure is built using Terraform.

4 - In addition, I make use of Terragrunt to create this setup for multiple environments to Keep Terraform code DRY approach.


## Architecture Diagram
![Alt text](./architecture-dagram-front-end-cicd-pipeline-s3-cloudfront.png?raw=true "Architecture Diagram FrontEnd CICD Pipeline S3 CloudFront")


## Resources
[Terragrunt](https://terragrunt.gruntwork.io/)

[Terragrunt-configuration](https://developer.newrelic.com/terraform/terragrunt-configuration) 
