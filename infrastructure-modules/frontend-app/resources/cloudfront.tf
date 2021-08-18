resource "aws_cloudfront_distribution" "frontend_cloudfront_distribution"  {
  origin {
    domain_name = aws_s3_bucket.frontend_app_bucket.bucket_domain_name
    origin_id   = "${var.application_subdomain}"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {

    viewer_protocol_policy = "redirect-to-https"
    compress               = true
 
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${var.application_subdomain}"

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

  }

  custom_error_response {
    error_caching_min_ttl = 3000
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }
  
  aliases = ["${var.application_subdomain}"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "${var.bucket_name}-distribution-${var.environment}"
    Environment = var.environment
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}