module "lambdas" {
  source                     = "./modules/lambda"
  lambda_project_environment = var.environment
  lambda_code_parameters     = var.code_parameters
}