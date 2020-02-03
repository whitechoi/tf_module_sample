# Lambda Function

resource "aws_s3_bucket_object" "default" {
  bucket = var.s3_bucket
  source = var.s3_source == "" ? var.s3_key : var.s3_source
  key    = var.s3_key
}

data "aws_s3_bucket" "source" {
  bucket = var.source_bucket
}

resource "aws_lambda_function" "default" {
  function_name = "${var.stage}-${var.name}"
  description   = var.description

  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  runtime = var.runtime
  handler = var.handler

  memory_size = var.memory_size
  timeout     = var.timeout

  role = aws_iam_role.default.arn

  depends_on = [
    aws_iam_role.default,
    aws_iam_role_policy.default,
    aws_s3_bucket_object.default,
  ]

  environment {
    variables = var.env_vars
  }
}

resource "aws_s3_bucket_notification" "default" {
  bucket = data.aws_s3_bucket.source.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.default.arn

    events = [
      "s3:ObjectCreated:*",
    ]

    filter_prefix = var.filter_prefix
    filter_suffix = var.filter_suffix
  }
}

resource "aws_lambda_permission" "default" {
  action        = "lambda:invokeFunction"
  function_name = aws_lambda_function.default.arn
  principal     = "s3.amazonaws.com"
  statement_id  = "AllowExecutionFromS3Bucket"
  source_arn    = data.aws_s3_bucket.source.arn
}