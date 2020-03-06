module "aggregator" {
  source = "../"
  
  aggregator_account_id     =   "354334841216"
  aggregator_account_region =   "ap-southeast-2"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
  is_aggregator = true
}

module "bucket" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
}

module "recorder" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
}

module "role" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
  
}

module "rules" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
  
}

module "sns" {
  source = "../"
  bucket_name   =   "cmdlab-sandpit2-${random_string.random.result}"
  
}


resource "random_string" "random" {
    length  =   8
    special =   false
    upper   =   false
  
}



