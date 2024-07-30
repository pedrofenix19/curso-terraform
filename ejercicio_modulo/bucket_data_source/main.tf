data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.prefijo_bucket

  force_destroy = true
}

resource "aws_s3_bucket_policy" "allow_access_to_user" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.allow_access_to_user.json
}

data "aws_iam_policy_document" "allow_access_to_user" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["${data.aws_caller_identity.current.arn}"]
    }

    actions = [
      "s3:Get*",
      "s3:List*"
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}