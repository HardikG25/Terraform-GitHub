locals {
  name = "s3_sqs_lambda"
  tags = {
    Name        = "S3_SQS_LAMBDA"
    Environment = "Dev"
    ManagedBy   = "Hardik Grover"
    Resource    = "hashicorp.aws"
  }
}
