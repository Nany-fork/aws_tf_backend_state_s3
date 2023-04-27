resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    name = "example bucket"
    env  = "dev"
  }
}

resource "aws_s3_object" "object_se" {
  bucket       = aws_s3_bucket.example_bucket.id
  key          = "hello-world"
  source       = "hello-world.html"
  content_type = "text/html"
}