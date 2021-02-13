resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name  = var.bucket_name
    goal  = var.goal
    owner = var.owner
  }
}
