module "aggregator" {
  source = "../"
  
  aggregator_account_id     =   "722141136946"
  aggregator_account_region =   "ap-southeast-2"
  bucket_name   =   "cmdlab-sandpit1-${random_string.random.result}"
}

module "bucket" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit1-${random_string.random.result}"
}


resource "random_string" "random" {
    length  =   8
    special =   false
  
}



