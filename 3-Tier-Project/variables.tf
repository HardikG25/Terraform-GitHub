variable "project_prefix" {
  description = "Name of the project"
  type        = string
}

variable "cidr" {
  description = "Ip address for vpc"
  type        = string
}

variable "environment" {
  description = "Environment of the project"
  type        = string
}

variable "public_sub_cidr" {
  description = "Cidr blocks for subnets"
  type        = list(string)
}

variable "private_sub_cidr" {
  description = "Cidr blocks for subnets"
  type        = list(string)
}

variable "availabilityZones" {
  description = "Availability zones for each subnet"
  type        = list(string)
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 1
}

variable "region" {
  description = "Region of the application built"
  type        = string
}

variable "cidr_ingress" {
  description = "cidr block for inbound traffic"
  type        = list(string)
}

variable "keyPairPath" {
  description = "Path to where key will be created"
  default     = "*"
}
