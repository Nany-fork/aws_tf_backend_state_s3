## Buckets
resource "aws_s3_bucket" "example_bucket_state" {
  bucket = var.bucket_state_name
  tags = {
    name = "stoare terraform state "
    env  = "dev"
  }
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name

  tags = {
    name = "example bucket"
    env  = "dev"
  }
}

## Bucket Object
resource "aws_s3_object" "object_se" {
  bucket       = aws_s3_bucket.example_bucket.id
  key          = "hello-world"
  source       = "hello-world.html"
  content_type = "text/html"
}

## Bucket Policy

resource "aws_iam_policy" "policys3" {
  name        = "policy-s3"
  description = "My test policy"

  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.example_bucket_state.arn}"
    },
    {
      "Action": [
        "s3:GetObject", 
        "s3:PutObject", 
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.example_bucket_state.arn}/apps"
    }
  ]

}
EOT
}