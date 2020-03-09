module "aggregator" {
  source = "../"

  aggregator_account_id     = "354334841216"
  aggregator_account_region = "ap-southeast-2"
  bucket_name               = "cmdlab-sandpit-${random_string.random.result}"
  is_aggregator             = true
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false

}



