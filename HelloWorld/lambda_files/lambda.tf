data "archive_file" "zip" {
  type        = "zip"
  source_file = "${path.module}/./hello_world.py"
  output_path = "hello_world.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello_world"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  role    = aws_iam_role.iam_for_lambda.arn
  handler = "hello_world.lambda_handler"
  runtime = "python3.12"

  environment {
    variables = {
      name = "World"
    }
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.policy.json
}