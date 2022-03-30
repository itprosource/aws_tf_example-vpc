provider "aws" {
  region = "us-east-1"
}

module "simple_vpc" {
  source = "../.."

  name = "example"
  cidr = "10.0.0.0/16"
    az = "us-east-1a"

   public_subnet = "10.0.1.0/24"
  private_subnet = "10.0.2.0/24"
}