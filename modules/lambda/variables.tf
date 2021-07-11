variable "app_data" {
    type = object({
      environment  = string
      domain_alias = string
      name = string
    })
}



variable "lambda_default_role" {
    type = object({
      dev  = string
      prod = string
    })
  default = {
    dev = ""
    prod  = ""
  }
}


variable "lambda_functions" {
  type    = map(any)
  default = {}
  description = "An object containing child objects with function details"
}

variable "lambda_function_prefix" {
  type = string
  default = ""
  description = "We need a prefix to prepend to the function suffix. It must be less than 64 chars."
}

variable "lambda_edge_region" {
  type = string
  default = ""
}

variable "filename" {
  type = string
  default = ""
}

variable "function_name" {
  type = string
  default = ""
}

variable "role" {
  type = string
  default = ""
}