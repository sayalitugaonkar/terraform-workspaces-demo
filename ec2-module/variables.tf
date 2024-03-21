
variable "ami_id" {
  type    = string
  default = "ami-0bb595719b559585f" # ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20231030
}

variable "instance" {
  type    = string

}


variable "subnet-1-id" {
  type = any
}


variable "vpc-id" {
  type = any
}
