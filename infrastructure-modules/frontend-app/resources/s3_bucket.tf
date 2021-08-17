resource "aws_s3_bucket" "frontend_app_bucket" {
  bucket  = ""
  acl     = ""
  policy  = ""

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  versioning {
    enabled = var.versioning
  }

  tags = {
    Name = var.bucket_name
  }
}