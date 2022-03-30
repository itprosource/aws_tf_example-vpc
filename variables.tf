variable "name" {
  description = "Name for VPC and all resource tags."
  type = string
  default = ""
}

variable "cidr" {
  description = "CIDR block for VPC."
  type = string
  default = ""
}

variable "public_subnet" {
  description = "CIDR block for public subnet."
  type = string
  default = ""
}

variable "private_subnet" {
  description = "CIDR block for private subnet."
  type = string
  default = ""
}

variable "az" {
  description = "Availability Zone for subnets."
  type = string
  default = ""
}

