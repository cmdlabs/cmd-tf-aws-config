variable "bucket_name" {}

module "source" {
  source        = "github.com/cmdlabs/terraform-aws-config?ref=0.3.0"
  is_aggregator = false
  bucket_name   = var.bucket_name
}