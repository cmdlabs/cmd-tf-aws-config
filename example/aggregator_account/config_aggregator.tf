variable "aggregator_account_id" {}
variable "source_account_id" {}

variable "bucket_name" {}

module "aggregator" {
  source                    = "github.com/cmdlabs/terraform-aws-config?ref=0.3.0"
  is_aggregator             = true
  aggregator_account_id     = var.aggregator_account_id
  aggregator_account_region = "ap-southeast-2"
  source_account_ids        = [var.source_account_id]
  bucket_name               = var.bucket_name
}