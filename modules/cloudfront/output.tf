
output "arn" {
  value = aws_cloudfront_distribution.cloudfront_module_distribution.arn
}


output "hosted_zone_id" {
  value = aws_cloudfront_distribution.cloudfront_module_distribution.hosted_zone_id
}

output "domain_name" {
  value = aws_cloudfront_distribution.cloudfront_module_distribution.domain_name
}

output "id" {
  value = aws_cloudfront_distribution.cloudfront_module_distribution.id
}

output "origin_access_identity_arn" {
  value = aws_cloudfront_origin_access_identity.cloudfront_module_origin_access_identity.iam_arn
}