variable "app_data" {
    type = object({
      environment  = string
      domain_alias = string
      name = string
    })
}

