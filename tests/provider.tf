provider "aws" {
  region                  = "ap-southeast-2"
  version                 = "~> 2.0"
  profile                 = "cmdlabtf-sandpit"
  skip_metadata_api_check = true
}
