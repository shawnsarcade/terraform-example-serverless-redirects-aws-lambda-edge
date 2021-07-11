variable "app_data" {
  type = object({
    environment  = string
    domain_alias = string
    name         = string
  })
}

variable "aws_region" {
  description = "Region to host resources"
  type        = string
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "Local machine profile to use from aws config"
  type        = string
  default     = "dev"
}




# CLOUDFRONT MODULE
variable "origin_access_identity_arn" {
  type    = string
  default = ""
}

variable "cloudfront_web_acl_id" {
  type = object({
    prod = string
    dev  = string
  })
}

variable "cloudfront_ssl_certificate_arn" {
  type = object({
    prod = string
    dev  = string
  })
}

variable "s3_bucket_bucket_domain_name" {
  type    = string
  default = ""
}


variable "s3_bucket_id" {
  type    = string
  default = ""
}




# LAMBDA MODULE
variable "lambda_module_qualified_arn" {
  type    = string
  default = ""
}

variable "lambda_function_prefix" {
  type    = string
  default = ""
}

variable "lambda_default_role" {
  type = object({
    dev  = string
    prod = string
  })
  default = {
    dev  = ""
    prod = ""
  }
}


variable "lambda_functions" {
  type    = map(any)
  default = {}
}


variable "lambda_edge_region" {
  type    = string
  default = ""
}