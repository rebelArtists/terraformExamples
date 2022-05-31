provider "aws" {
  region = "us-east-1"
}

module "state-lock-services-prod" {
  source = "../../../modules/global/state-lock"

  dynamo_table_name = "webserver_state_lock_prod"
  state_bucket_name = "terraform-webservers-prod"
  state_file_key = "terraform.tfstate"
}
