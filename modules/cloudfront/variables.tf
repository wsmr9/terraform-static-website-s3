variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "description" {
  description = "The description of the OAC"
  default     = "OAC for S3 bucket"
  type        = string
}

variable "origin_access_control_origin_type" {
  description = "The origin type of the OAC"
  default     = "s3"
  type        = string
}

variable "signing_behavior" {
  description = "The signing behavior of the OAC"
  default     = "always"
  type        = string
}

variable "signing_protocol" {
  description = "The signing protocol of the OAC"
  default     = "sigv4"
  type        = string

}

variable "price_class" {
  description = "The price class of the CloudFront distribution"
  default     = "PriceClass_100"
  type        = string
}

variable "default_root_object" {
  description = "The default root object of the CloudFront distribution"
  default     = "index.html"
  type        = string
}

variable "viewer_protocol_policy" {
  description = "The viewer protocol policy of the CloudFront distribution"
  default     = "allow-all"
  type        = string
}

variable "allowed_methods" {
  description = "The allowed methods of the CloudFront distribution"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "The cached methods of the CloudFront distribution"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "compress" {
  description = "The compress of the CloudFront distribution"
  default     = true
  type        = bool
}

variable "restrictions" {
  description = "The restrictions of the CloudFront distribution"
  type        = map(any)
  default = {
    geo_restriction = {
      restriction_type = "whitelist"
      locations        = ["US"]
    }
  }
}

variable "custom_error_response" {
  description = "The custom error response of the CloudFront distribution"
  type        = map(any)
  default = {
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
  }

}
