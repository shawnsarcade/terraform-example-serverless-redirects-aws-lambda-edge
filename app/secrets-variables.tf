variable "aws_access_keys" {
  type = object({
    prod = string
    dev  = string
  })
  #   sensitive = true
}


variable "aws_secret_keys" {
  type = object({
    prod = string
    dev  = string
  })
  #   sensitive = true
}