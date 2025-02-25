resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = "s3-oac-${var.bucket_name}"
  description                       = var.description
  origin_access_control_origin_type = var.origin_access_control_origin_type
  signing_behavior                  = var.signing_behavior
  signing_protocol                  = var.signing_protocol
}

resource "aws_cloudfront_distribution" "cf_distribution" {
  enabled             = true
  price_class         = var.price_class
  default_root_object = var.default_root_object

  origin {
    domain_name              = var.bucket_domain_name
    origin_id                = "S3-${var.bucket_name}"
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  default_cache_behavior {
    target_origin_id       = "S3-${var.bucket_name}"
    viewer_protocol_policy = var.viewer_protocol_policy
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    compress               = true
  }

  custom_error_response {
    error_code         = var.custom_error_response.error_code
    response_code      = var.custom_error_response.response_code
    response_page_path = var.custom_error_response.response_page_path
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restrictions.geo_restriction.restriction_type
      locations        = var.restrictions.geo_restriction.locations
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
