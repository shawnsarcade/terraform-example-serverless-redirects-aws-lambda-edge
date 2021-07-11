 resource "aws_s3_bucket_policy" "s3_policy_module_bucket_policy" {
  bucket = var.s3_bucket_module_id
    policy = data.aws_iam_policy_document.s3_policy_module_policy_data.json
}


data "aws_iam_policy_document" "s3_policy_module_policy_data" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${var.s3_bucket_module_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [var.cloudfront_module_origin_access_identity_arn]
    }
  }
}