terraform {
  backend "s3" {
    bucket         = "cmdlabtf-terraform-backend"
    key            = "module-cmd-tf-aws-config"
    region         = "ap-southeast-2"
    profile        = "cmdlabtf-tfbackend"
    dynamodb_table = "cmdlabtf-terraform-lock"
  }
}
