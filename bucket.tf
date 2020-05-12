resource "aws_s3_bucket" "bucket" {
  count = var.is_aggregator ? 1 : 0

  acl           = "private"
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    transition {
      days          = var.transition_to_glacier
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration
    }
  }
}

resource "aws_s3_bucket_policy" "config" {
  count  = var.is_aggregator ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  policy = data.aws_iam_policy_document.config.json
}
