variable "vpc_config" {
  description = "To get the required CIDR block and VPC form user"
  type = object({
    cidr_block = string
    name       = string
  })

}

variable "subnet_config" {
  description = "To get CIDR block and Availablilty zones for the subnets"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

}
