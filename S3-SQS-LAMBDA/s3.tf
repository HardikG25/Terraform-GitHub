resource "aws_s3_bucket" "sqsLambdaBkt" {
  bucket = "${local.name}-s3-bucket"
  tags   = local.tags
}

