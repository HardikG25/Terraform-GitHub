data "archive_file" "zip" {
  type        = "zip"
  source_file = "hello_world.py"
  output_path = "hello_world.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello_world"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  role    = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "hello_world.hello_lambda"
  runtime = "python3.12"

  environment {
    variables = {
      name = "Hello"
    }
  }
}