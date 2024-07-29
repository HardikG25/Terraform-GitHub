data "aws_iam_policy_document" "lambdaAssumeRole" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "${local.name}-lambda-iam-role"
  assume_role_policy = data.aws_iam_policy_document.lambdaAssumeRole.json
}

data "archive_file" "s3_sqs_file" {
  type        = "zip"
  source_dir  = "${path.module}/lambdas"
  output_path = "${path.module}/lambdas/lambda_handler.zip"
}

resource "aws_lambda_function" "s3SqsLambda" {
  filename         = "${local.name}-lambda-part"
  function_name    = "${local.name}-lambda-function"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = var.handler
  source_code_hash = data.archive_file.s3_sqs_file.output_base64sha256

  runtime = var.runtime
}
