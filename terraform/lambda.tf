resource "aws_lambda_function" "bmr_lambda" {
  function_name = "bmr-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  environment {
    variables = {
      INPUT_BUCKET  = var.input_bucket
      OUTPUT_BUCKET = var.output_bucket
      DDB_TABLE     = var.ddb_table
    }
  }
}
