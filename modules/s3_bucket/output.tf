output "id" {
  value = aws_s3_bucket.s3_bucket_module.id
}

output "website_domain" {
  value = aws_s3_bucket.s3_bucket_module.website_domain
}

output "website_endpoint" {
  value = aws_s3_bucket.s3_bucket_module.website_endpoint
}

output "bucket_domain_name" {
  value = aws_s3_bucket.s3_bucket_module.bucket_domain_name
}

output "arn" {
  value = aws_s3_bucket.s3_bucket_module.arn
}