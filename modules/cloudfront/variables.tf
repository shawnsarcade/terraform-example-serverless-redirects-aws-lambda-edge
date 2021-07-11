variable "app_data" {
  type = object({
    environment  = string
    domain_alias = string
    name         = string
  })
}

variable "cloudfront_web_acl_id" {
  type = object({
    prod  = string
    dev = string
  })
}

variable "cloudfront_ssl_certificate_arn" {
  type = object({
    prod  = string
    dev = string
  })
}


variable "s3_bucket_module_bucket_domain_name" {
  type = string
  default = ""
}


variable "s3_bucket_module_id" {
  type = string
  default = ""
}

variable "lambda_module" {
  type = any
  default = ""
}

variable "lambda_functions" {
  type    = map(any)
  default = {}
}



