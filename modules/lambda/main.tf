resource "aws_lambda_function" "lambda_module_lambda_function" {

  # LAMBDA@EDGE REQUIRES A SPECIFIC VERSION TO BE REFERENCED
  # INSTRUCT TERRAFORM TO PUBLISH A NEW VERSION WITH EVERY CHANGE
  publish = true


  filename      = var.filename
  function_name = var.function_name


  role    = var.role
  handler = "index.handler"
  runtime = "nodejs12.x"

}
