# How auto deploy react app to aws S3 & CloudFront using terraform

This repository contains the source code

## Goal 

1 - The CI/CD pipeline pulls the source code from GitHub and run tests against the application before deploying it to an aws S3 bucket for frontend hosting.

2 - The frontend will then be distributed using CloudFront which will point to the S3 bucket. 

3 - All of the infrastructure is built using Terraform.

4 - In addition, I make use of Terragrunt to create this setup for multiple environments in a DRY approach.


## Architecture Diagram
![Alt text](./architecture-s3-cloudfront.png?raw=true "Architecture Diagram")


