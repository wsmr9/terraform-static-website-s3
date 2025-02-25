output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value = aws_s3_bucket.static_site.bucket
}

output "s3_bucket_arn" {
    description = "The ARN of the S3 bucket"
    value = aws_s3_bucket.static_site.arn
}

output "s3_domain_name" {
  description = "The domain name of the S3 bucket"
  value = aws_s3_bucket.static_site.bucket_regional_domain_name
}