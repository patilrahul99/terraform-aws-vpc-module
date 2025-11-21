# terraform aws vpc module

## Overview ##

This Terraform module creates an aws vpc with a given CIDR block.
It also creates multiple subnets (public and private), and for public
subnets, it sets up an internet gateway and appropriate route tables.

### Features ###

- creates a vpc with a specific CIDR block.
- creates public and private subnets.
- creates an internet gateway for public subnets.
- sets up route tables for public subnets.

## Usage ##

```
provider "aws" {
  region = "provide-your-region" # e.g: eu-north-1

}

module "vpc" {
  source = "./Your-vpc-module-folder" # e.g: "./vpc-module"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "Sample-vpc"
  }

  subnet_config = {
    # key = {cidrblock, az}

    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      
      # To set the subnet as public, default is private
      public     = true 
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }

  }
}

```