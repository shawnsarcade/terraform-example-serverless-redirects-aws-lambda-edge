# DEFAULT AWS REGION FOR DEVELOPMENT/TESTING
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# REGION FOR DEVELOPMENT/TESTING OF LAMBDA@EDGE FUNCTIONS
provider "aws" {
  alias   = "dev_virgina"
  profile = "dev"
  region  = "us-east-1"
}

# PRODUCTION REGION
provider "aws" {
  alias      = "prod"
  profile    = "default"
  region     = var.aws_region
  access_key = var.aws_access_keys.prod
}

# PRODUCTION REGION FOR LAMBDA@EDGE FUNCTION
provider "aws" {
  alias   = "prod_virgina"
  profile = "default"
  region  = "us-east-1"
}

module "lambda_module" {
  for_each               = var.lambda_functions
  source                 = "../modules/lambda"
  lambda_function_prefix = var.lambda_function_prefix
  app_data               = var.app_data
  providers = {
    aws = aws.prod_virgina
  }

  filename      = each.value.file_name
  function_name = "${var.app_data.environment}-${var.lambda_function_prefix}-${each.value.function_name_suffix}"
  role          = var.lambda_default_role[var.app_data.environment]

}

module "s3_bucket_module" {
  source   = "../modules/s3_bucket"
  app_data = var.app_data
}



module "cloudfront_module" {
  source                         = "../modules/cloudfront"
  cloudfront_ssl_certificate_arn = var.cloudfront_ssl_certificate_arn
  cloudfront_web_acl_id          = var.cloudfront_web_acl_id
  app_data                       = var.app_data

  s3_bucket_module_bucket_domain_name = module.s3_bucket_module.bucket_domain_name
  s3_bucket_module_id                 = module.s3_bucket_module.id

  lambda_functions = var.lambda_functions
  lambda_module = module.lambda_module
}

module "s3_policy_module" {
  source                                       = "../modules/s3_policy"
  s3_bucket_module_id                          = module.s3_bucket_module.id
  s3_bucket_module_arn                         = module.s3_bucket_module.arn
  cloudfront_module_origin_access_identity_arn = module.cloudfront_module.origin_access_identity_arn
}