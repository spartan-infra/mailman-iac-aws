environment = "dev"

code_parameters = {
  logger = {
    name    = "sls_logger"
    runtime = "go1.x"
    handler = "bin/slslogger"
  }
  rest-api = {
    name    = "sls_rest"
    runtime = "go1.x"
    handler = "bin/slsrest"
  }
}