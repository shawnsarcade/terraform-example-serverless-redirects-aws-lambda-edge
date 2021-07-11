resource "aws_cloudfront_distribution" "cloudfront_module_distribution" {
  origin {

    domain_name = var.s3_bucket_module_bucket_domain_name
    origin_id   = var.s3_bucket_module_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.cloudfront_module_origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  
  logging_config {
    include_cookies = false
    bucket          = "shawns-arcade-dev-${var.app_data.environment}-web-redirect-logs.s3.amazonaws.com"
    prefix          = "${var.app_data.environment}/redirects/${var.app_data.domain_alias}cloudfront-logs"
  }

  aliases = [var.app_data.domain_alias]



  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.s3_bucket_module_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400


    dynamic "lambda_function_association" {
      for_each = var.lambda_functions
      iterator = each
      content {
        event_type   = each.value.event_type
        lambda_arn   = var.lambda_module[each.key].qualified_arn
        include_body = each.value.include_body
      }
    }

  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = var.app_data.environment
  }

  web_acl_id = var.cloudfront_web_acl_id[var.app_data.environment]

  viewer_certificate {
    acm_certificate_arn      = var.cloudfront_ssl_certificate_arn[var.app_data.environment]
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }
}



resource "aws_cloudfront_origin_access_identity" "cloudfront_module_origin_access_identity" {
  comment = "Origin Access Identity: ${var.app_data.name}"
}






