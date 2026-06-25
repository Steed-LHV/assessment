variable "vpc_id" {
  description = "The VPC ID from the root module"
  type        = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}
