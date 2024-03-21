resource "aws_s3_bucket" "example" {
  bucket = lower(join("-",["sayali",var.env_module.vpc_name,"bucket"]))

  tags = {
    Name        = join("-",[var.env_module.vpc_name, "bucket"])
    #Environment = var.env_module
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "l1" {
  bucket = aws_s3_bucket.example.id
  rule {
    status = "Enabled"
    id     = "expire_all_files"
    expiration {
        days = 30
    }
  }
}
