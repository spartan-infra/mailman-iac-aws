resource "aws_lambda_function" "lambda_function" {
  for_each = { for k, v in var.lambda_code_parameters : k => v }

  function_name = join("-", [var.lambda_project_environment, each.value.name])
  description   = format("Lambda %s used as lab for AWS Lambda Go course", each.value.name)
  runtime       = each.value.runtime
  handler       = each.value.handler
  filename      = data.archive_file.dummy_dist.output_path



  role = aws_iam_role.lambda_iam_base.arn
}

resource "aws_cloudwatch_log_group" "lambda_cloudwatch_group" {
  for_each = { for k, v in var.lambda_code_parameters : k => v }
  name     = "/aws/lambda/${join("-", [var.lambda_project_environment, each.value.name])}"

  retention_in_days = 30
}