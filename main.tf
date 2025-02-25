module "s3" {
  source         = "./modules/s3"
  bucket_name    = var.bucket_name
}

module "cloudfront" {
  source      = "./modules/cloudfront"
  bucket_name = module.s3.s3_bucket_name
}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = module.s3.s3_bucket_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action = "s3:GetObject"
        Resource = "${module.s3.s3_bucket_arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = module.cloudfront.cloudfront_arn
          }
        }
      }
    ]
  })
}