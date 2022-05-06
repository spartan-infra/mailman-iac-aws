variable "lambda_project_environment" {
  description = "[REQUIRED] Project environment where the resources are created."
  type        = string
}

variable "lambda_code_parameters" {
  description = "[REQUIRED] Information required to create the lambda."
  type        = map(any)
  default = {
    "1" = {
      runtime                   = ""
      handler                   = ""
      name                      = ""
      require_additional_policy = false
    }
  }
}