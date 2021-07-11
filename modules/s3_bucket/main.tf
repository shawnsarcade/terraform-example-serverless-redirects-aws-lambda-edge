resource "aws_s3_bucket" "s3_bucket_module" {
  bucket = var.app_data.domain_alias
  website {
    index_document = "index.html"
    error_document = "error.html"
      }
}