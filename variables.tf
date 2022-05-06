variable "environment" {
  description = "[REQUIRED] Environment where the infrastructure will be created"
  type        = string
}

variable "code_parameters" {
  description = "[REQUIRED] Lambda application parameters."
  type        = map(any)
}