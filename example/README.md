
 ## In depth the Complete configuration to use this module ####
 ### The usage ###

```
provider "aws" {
  region = "eu-north-1" # Your region
}

module "vpc" {
  source = "./modules" # your own vpc module folder path

  vpc_config = {
    cidr_block = "10.0.0.0/16" # provide valid CIDR Block range
    name       = "test-vpc" # vpc name
  }

  subnet_config = {
    # key = {cidrblock, az} # subnet config format

    public_subnet-0 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      public     = true # default subnet is private 
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

```