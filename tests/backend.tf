terraform {
  backend "s3" {
    bucket                  = "cmdlab-sandpit2-terraform-backend"
    key                     = "module-cmdlab-sandpit2-tf-aws-config"
    region                  = "ap-southeast-2"
    profile                 = "cmdlab-sandpit2"
    dynamodb_table          = "cmdlab-sandpit2-terraform-lock"
    skip_metadata_api_check = true
  }
}
