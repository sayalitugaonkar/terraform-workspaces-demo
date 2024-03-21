locals {
  environments = {
    prod = {
      subnets = {
        "subnet-1" = { cidr_block = "10.0.1.0/24", availability_zone = "ap-south-1a", tag_name = "private-subnet-1a" }

      }


      vpc_name = "Prod"
      subnet_pub = {
        "subnet-1" = { cidr_block = "10.0.4.0/24", availability_zone = "ap-south-1a", tag_name = "public-subnet-1a" }
      }
      instance_type = "t2.large"
    }

    staging = {
      subnets = {
        "subnet-1" = { cidr_block = "10.0.1.0/24", availability_zone = "ap-south-1a", tag_name = "private-subnet-1a" }
        "subnet-2" = { cidr_block = "10.0.2.0/24", availability_zone = "ap-south-1b", tag_name = "private-subnet-1b" }
      }

      vpc_name = "Staging"
      subnet_pub = {
        "subnet-1" = { cidr_block = "10.0.4.0/24", availability_zone = "ap-south-1a", tag_name = "public-subnet-1a" }
        "subnet-2" = { cidr_block = "10.0.5.0/24", availability_zone = "ap-south-1b", tag_name = "public-subnet-1b" }
      }
     instance_type = "t2.medium"
    }

    dev = {
      subnets = {
        "subnet-1" = { cidr_block = "10.0.1.0/24", availability_zone = "ap-south-1a", tag_name = "private-subnet-1a" }
      }

      vpc_name = "Dev"
      subnet_pub = {
        "subnet-1" = { cidr_block = "10.0.4.0/24", availability_zone = "ap-south-1a", tag_name = "public-subnet-1a" }
      }
      instance_type = "t2.nano"
    }

    default = {
      count = 0
      subnets = {
        "subnet-1" = { cidr_block = "10.0.1.0/24", availability_zone = "ap-south-1a", tag_name = "private-subnet-1a" }
        "subnet-2" = { cidr_block = "10.0.2.0/24", availability_zone = "ap-south-1b", tag_name = "private-subnet-1b" }
        "subnet-3" = { cidr_block = "10.0.3.0/24", availability_zone = "ap-south-1c", tag_name = "private-subnet-1c" }
      }
      count    = 0
      vpc_name = "default"
      subnet_pub = {
        "subnet-1" = { cidr_block = "10.0.4.0/24", availability_zone = "ap-south-1a", tag_name = "public-subnet-1a" }
        "subnet-2" = { cidr_block = "10.0.5.0/24", availability_zone = "ap-south-1b", tag_name = "public-subnet-1b" }
        "subnet-3" = { cidr_block = "10.0.6.0/24", availability_zone = "ap-south-1c", tag_name = "public-subnet-1c" }
      }
      instance_type = "t2.nano"

    }

  }

}

locals {
  env = lookup(local.environments, terraform.workspace)

}



