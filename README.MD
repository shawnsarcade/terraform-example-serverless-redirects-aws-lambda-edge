# Terraform Starter: Serverless Redirects with Lambda

## What this does:
- Manage an S3 Bucket for static website
- Manage an S3 policy for CloudFront Origin Idenity access
- Manage the CloudFront distribution for the redirects
- Manage lambda@edge redirect function(s) 
- Connect lambda function(s) to the Cloudfront distribution

## Copy the */app* directory
- Create a duplicate of the app directory fore each required environments i.e: development, staging, production.

## Create secrets-variables.tfvars
- Copy /secrets-variables.example.tfvars to /secrets-variables.tfvars
- Update prod and dev details for each object

## Edit Global App Variable
- Locate the *app_data* object in /<env>/main.tfvars and modify as needed.

## Lambda Setup
- Save redirect code in *<env>/lambda_function/cloudfront-<CLOUDFRONT_EVENT_TYPE>/index.js*
- Create a zip form the index.js file with the name index.zip
- Origin request responses are enabled by default. If additional events/functions are needed modify: /modules/lambda/main.tfvars 

## RUN
terraform init
terraform fmt
terraform validate
terraform apply

## TERRAFORM APPLY (AUTO-APPROVE)
terraform apply -auto-approve -input=false -var-file main.tfvars -var-file secrets-variables.tfvars -var-file ../modules/cloudfront/main.tfvars -var-file ../modules/lambda/main.tfvars -lock=false

## TERRAFORM APPLY
terraform apply  -input=false -var-file main.tfvars -var-file secrets-variables.tfvars -var-file ../modules/cloudfront/main.tfvars -var-file ../modules/lambda/main.tfvars -lock=false 