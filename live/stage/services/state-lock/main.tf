provider "aws" {
  region = "us-east-1"
}

module "state-lock-services-stage" {
  source = "../../../../modules/global/state-lock"

  dynamo_table_name = "webserver_state_lock_stage"
  state_bucket_name = "terraform-webservers-stage"
  state_file_key = "terraform.tfstate"
}
