provider "aws" {
  region = "eu-north-1"

}

module "vpc" {
  source = "./modules"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "test-vpc"
  }

  subnet_config = {
    # key = {cidrblock, az}

    public_subnet-0 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      public     = true
    }

    public_subnet-1 = {
      cidr_block = "10.0.2.0/24"
      az         = "eu-north-1a"
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }

  }
}
