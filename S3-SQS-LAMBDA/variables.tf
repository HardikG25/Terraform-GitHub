variable "region" {
  description = "Region for AWS running environment"
  type        = string
}

variable "runtime" {
  description = "Runtime on which function executes"
  type        = string
  default     = "python3.12"
}

variable "aws_access_key" {
  description = "Access Key for AWS Environment"
  type        = string
}

variable "secret_key" {
  description = "Value for secret key of access key"
  type        = string
}

variable "handler" {
  description = "Handler on which lambda function runs"
  type        = string
}

